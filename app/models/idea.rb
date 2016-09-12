class Idea < ActiveRecord::Base
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :thought, presence: true

end
