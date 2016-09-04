class ChangeDeadlineNewNewTypeInProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :deadline, :date
  end
end
