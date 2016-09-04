class Product < ApplicationRecord
  has_many :bids
  has_many :users, through: :bids
  belongs_to :user

  validates :title, :deadline, presence: true
  validates :minimum_amount, :numericality => { :greater_than_or_equal_to => 0 }

  def can_new_bids?
    deadline >= Date.today
  end

  def calculate_minimum_amount
    min_amount = minimum_amount || 0
    max_amount_bid = bids.maximum(:amount) || min_amount
    [min_amount, max_amount_bid].max
  end
end
