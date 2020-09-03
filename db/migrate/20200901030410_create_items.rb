class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text       :item_image,             null: false
      t.string     :item_name,              null: false
      t.text       :item_text,              null: false
      t.integer    :category_id,            null: false
      t.integer    :status_id,              null: false
      t.integer    :shipping_charger_id,    null: false
      t.integer    :shipping_origin_id,     null: false
      t.integer    :days_until_shipping_id, null: false
      t.integer    :price,                  null: false
      t.references :user,                   null: false, foreign_key: true
      t.timestamps
    end
  end
end