class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.text :comment
      t.integer :status
      t.references :mushroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
