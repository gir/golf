class Language < ActiveRecord::Base
  has_many :submissions

  validates_presence_of :name
end
