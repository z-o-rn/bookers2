class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :book

  validates :user, uniqueness: true

end
