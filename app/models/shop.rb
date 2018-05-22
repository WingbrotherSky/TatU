class Shop < ApplicationRecord
  belongs_to :user
  has_many :artists
end
