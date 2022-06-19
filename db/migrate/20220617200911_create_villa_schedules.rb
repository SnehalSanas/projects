class CreateVillaSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :villa_schedules, :id=>false do |t|
      t.column :id, BIGINT_PRIMARY_ID
      t.column :villa_id, BIGINT_UNSIGNED
      t.boolean :availability, limit: 1, default: 0
      t.float :price 
      t.date :booking_date
      t.timestamps
    end
    add_index :villa_schedules, [:booking_date, :villa_id], unique: true
  end
end






