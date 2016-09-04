class FixMinimumBidToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :minimum_bid, :minimum_amount
  end
end
