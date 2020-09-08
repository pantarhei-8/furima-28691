class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_origin

  belongs_to :customer

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
  end

end
