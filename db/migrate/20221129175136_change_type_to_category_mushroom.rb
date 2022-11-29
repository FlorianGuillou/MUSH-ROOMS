class ChangeTypeToCategoryMushroom < ActiveRecord::Migration[7.0]
  def change
    rename_column :mushrooms, :type, :category
  end
end
