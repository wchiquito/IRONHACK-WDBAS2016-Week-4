class User < ApplicationRecord
  has_many :bids
  has_many :products, through: :bids

  validates :name, :email, presence: true
end