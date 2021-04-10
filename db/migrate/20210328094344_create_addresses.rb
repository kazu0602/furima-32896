class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase, foreign_key: true, null: false
      t.string :postcode, default: "", null: false
      t.integer :prefecture 
      t.string :city, default: "", null: false
      t.string :block, default: "", null: false
      t.string :building, defaule: ""
      t.string :phone_number, default: "", null: false
      t.timestamps
    end
  end
end
