class AddReferencesToMushroom < ActiveRecord::Migration[7.0]
  def change
    add_column :mushrooms, :user, :references, foreign_key: true
  end
end
