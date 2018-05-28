class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :art

  validates uniqueness: { scope: :user_id }
end
