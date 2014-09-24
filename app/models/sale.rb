class Sale < ActiveRecord::Base
  
  validates_presence_of :item_price
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |sale|
        csv << sale.attributes.values_at(*column_names)
      end
    end
  end
end
