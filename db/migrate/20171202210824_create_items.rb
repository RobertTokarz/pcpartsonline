class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :category
      t.string :brand
      t.string :image_url
      t.string :socket_Type
      t.decimal :promo_Price
      t.string :memory_Type

      t.timestamps
    end
  end
end
