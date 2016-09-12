class Idea < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :category

  validates :title, presence: true
  validates :thought, presence: true

end
