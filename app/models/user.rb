class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  has_one :shop
  has_one :inbox
  has_many :messages, through: :inbox
  has_many :favorites
  validates :auth_key, uniqueness: true
end
