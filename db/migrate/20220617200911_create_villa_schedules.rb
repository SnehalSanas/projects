class CreateVillaSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :villa_schedules, :id=>false do |t|
      t.column :id, BIGINT_PRIMARY_ID
      t.column :villa_id, BIGINT_UNSIGNED
      t.boolean :availability, limit: 1, default: 0, index: true
      t.float :price 
      t.date :booking_date
      t.timestamps
    end
    add_index :villa_schedules, [:villa_id, :booking_date], unique: true
  end
end

# VillaSchedule.create([
# {villa_id: 1, price: 1000, booking_date: '2021-01-01', availability: true},
# {villa_id: 1, price: 1000, booking_date: '2021-01-02', availability: true},
# {villa_id: 1, price: 1000, booking_date: '2021-01-03', availability: true},
# {villa_id: 1, price: 2000, booking_date: '2021-01-04', availability: true},
# {villa_id: 1, price: 1000, booking_date: '2021-01-05', availability: false},
# {villa_id: 1, price: 3000, booking_date: '2021-01-06', availability: true}]
# )

#Villa.create({name: 'abc', status: 1})



