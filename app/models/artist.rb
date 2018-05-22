class Artist < ApplicationRecord
  belongs_to :shop
  has_many :arts
end
