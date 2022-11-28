class ChangeColumnToMushroom < ActiveRecord::Migration[7.0]
  def change
    change_column :mushrooms, :trippy, :boolean, :default => false
    change_column :mushrooms, :eatable, :boolean, :default => false
  end
end
