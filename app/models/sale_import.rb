class SaleImport
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file, :errors
  attr_reader   :errors

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
    @errors = ActiveModel::Errors.new(self)
    @valid_columns = Sale.columns.map(&:name).map(&:to_sym)
  end

  def persisted?
    false
  end

  def valid_columns?(columns)
    (@valid_columns - columns).count == 6
  end

  def save(current_user, log_file)
    rows_imported = 0
    gross_revenue = 0
    imported_sales.each do |imported_sale|
      if valid_columns?(imported_sale.to_hash.keys)
        sale = Sale.create(imported_sale.to_hash.merge!(creator: current_user, updater: current_user, log_file: log_file))
        unless sale.valid?
          errors.add(:error, "Row: #{sale.errors.messages.to_s}")
          return false
        end
        rows_imported += 1
        gross_revenue += (sale.item_price * sale.purchase_count)
      else
        errors.add(:error, "Invalid columns")
        return false
      end
    end
    log_file.update(rows_imported: rows_imported, gross_revenue: gross_revenue)
    true
  end

  def imported_sales
    rows = []
    begin
      col_sep = CSV.read(file.path).to_s.include?("\\t") ? "\t" : ","
    rescue CSV::MalformedCSVError
      return []
    end
    CSV.foreach(file.path, headers: true, header_converters: :symbol, converters: :all, col_sep: col_sep) do |row|
      rows << row
    end
    return rows
  end

end
