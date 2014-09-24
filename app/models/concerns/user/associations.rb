module User::Associations
  extend ActiveSupport::Concern

  included do 
    belongs_to :creator, class_name: 'User', foreign_key: :created_by
    belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  end

end