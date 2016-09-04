class ChangeDeadlineTypeInProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :deadline, :timestamps
  end
end
