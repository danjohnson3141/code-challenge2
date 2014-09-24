class SaleImport
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    imported_sales = load_imported_sales
    
    imported_sales.each do |imported_sale|
      Sale.create(imported_sale.to_hash)
    end
    true
  end

  def load_imported_sales
    rows = []
    CSV.foreach(file.path, headers: true, header_converters: :symbol, converters: :all) do |row|
      rows << row
    end
    return rows
  end
end
