class CreateVillas < ActiveRecord::Migration[5.2]
  def change
    create_table :villas, :id=>false do |t|
      t.column :id, BIGINT_PRIMARY_ID
      t.string :name
      t.column :status, UNSIGNED, index: true
      t.timestamps
    end
    add_index :villas, [:name], unique: true
  end
end



