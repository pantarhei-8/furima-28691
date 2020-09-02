class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charger
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :days_until_shipping
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
  end
  
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 9999999 }
  # validates :price, format: { with: /\A[+-]?\d+\z/, message: "Out of setting range" }, length: { in: 3..7 }

  #プルダウンの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1, message: "Select" } do
    validates :category_id
    validates :status_id
    validates :shipping_charger_id
    validates :shipping_origin_id
    validates :days_until_shipping_id
  end
end
