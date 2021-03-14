class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      #先頭には画像を入れたい。
      t.references :user, foreign_key: true, null: false
      t.string :title , null: false
      t.text :concept, null: false
      t.string :category_id, null: false
      t.integer :status_id, null: false
      t.integer :fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_date_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
