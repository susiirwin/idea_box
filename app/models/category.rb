class Category < ActiveRecord::Base
  has_many :ideas

  validates :topic, presence: true, uniqueness: true
end
