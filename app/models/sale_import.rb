class SaleImport
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file, :errors
  attr_reader   :errors

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
    @errors = ActiveModel::Errors.new(self)
    @valid_columns = Sale.columns.map(&:name)
  end

  def persisted?
    false
  end

  def valid_columns?(column)
    @valid_columns.include? column
  end

  def save
    imported_sales.each do |imported_sale|
      binding.pry
      if valid_columns?(imported_sale.to_hash.keys)
        sale = Sale.create(imported_sale.to_hash)
        unless sale.valid?
          errors.add(:error, "Row: #{sale.errors.messages.to_s}")
          return false
        end
      else
        errors.add(:error, "Invalid columns")
        return false
      end
    end
    true
  end

  def imported_sales
    begin
      col_sep = CSV.read(file.path).to_s.include?("\\t") ? "\t" : ","
    rescue CSV::MalformedCSVError
      return []
    end
    rows = []
    CSV.foreach(file.path, headers: true, header_converters: :symbol, converters: :all, col_sep: col_sep) do |row|
      rows << row
    end
    return rows
  end

end
