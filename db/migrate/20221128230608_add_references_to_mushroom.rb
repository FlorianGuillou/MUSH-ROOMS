class AddReferencesToMushroom < ActiveRecord::Migration[7.0]
  def change
    add_column :mushrooms, :user_id, :integer, foreign_key: true
  end
end
