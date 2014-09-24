class Sale < ActiveRecord::Base
  include User::Associations

  belongs_to :log_file
  
  validates :item_price, presence: true
  validates :purchaser_name, presence: true
  validates :merchant_name, presence: true
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |sale|
        csv << sale.attributes.values_at(*column_names)
      end
    end
  end

end
