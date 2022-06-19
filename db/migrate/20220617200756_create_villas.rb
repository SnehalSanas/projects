class  CreateVillas < ActiveRecord::Migration[5.2]
  def change
    create_table :villas, :id=>false do |t|
      t.column :id, BIGINT_PRIMARY_ID
      t.string :name
      t.column :status, UNSIGNED, index: true
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode, limit: 15
      t.string :mobile, limit:15
      t.timestamps
    end
    
  end
end



