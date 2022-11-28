class CreateMushrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :mushrooms do |t|
      t.string :photo_url
      t.string :type
      t.string :color
      t.boolean :trippy, default: false
      t.boolean :eatable, default: false
      t.integer :price
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
