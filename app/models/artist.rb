class Artist < ApplicationRecord
  belongs_to :shop
  has_many :arts

  acts_as_taggable
  acts_as_taggable_on :styles
end
