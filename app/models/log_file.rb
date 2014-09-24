class LogFile < ActiveRecord::Base
  include User::Associations

  has_many :sales
end