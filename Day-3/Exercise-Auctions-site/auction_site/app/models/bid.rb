class Bid < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  belongs_to :product

  validates :amount, numericality: true
  validate :user_cannot_bid_on_their_own_product,
           :amount_must_be_greater_than

  def self.winning_bidder product_id
    max_amount = select(["product_id, MAX(amount) amount"])
    .where(product_id: product_id)
    .to_sql

    min_updated_at = ("SELECT derb_amount.product_id,
                              derb_amount.amount,
                              MIN(bids.updated_at) updated_at
                      FROM (#{max_amount}) derb_amount
                        INNER JOIN bids ON bids.product_id = derb_amount.product_id AND
                                           bids.amount = derb_amount.amount")

    bid_where = "bids.product_id = derb.product_id AND
                 bids.amount = derb.amount AND
                 bids.updated_at = derb.updated_at"

    joins("INNER JOIN (#{min_updated_at}) derb")
    .where(bid_where)
    .ids
  end

  private

  def find_product
    Product.find product_id
  end

  def user_cannot_bid_on_their_own_product
    if user_id == find_product.user.id
      errors.add(:user_id, 'Can\'t bid on their own product')
    end
  end

  def amount_must_be_greater_than
    minimum_amount = find_product.calculate_minimum_amount
    if amount.nil? || amount <= minimum_amount
      errors.add(:amount, "must be greater than #{minimum_amount}")
    end
  end
end
