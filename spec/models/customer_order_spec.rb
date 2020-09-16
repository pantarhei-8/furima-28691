require 'rails_helper'

RSpec.describe CustomerOrder, type: :model do
  describe CustomerOrder do
    before do
      @customer_order = FactoryBot.build(:customer_order)
    end

    describe '商品購入機能' do
      context '購入がうまくいく時' do
        it 'token,postal_code,shipping_origin_id,city,house_number,building_name,phone_number,customer_idが存在すれば購入できること' do
          expect(@customer_order).to be_valid
        end

        it '建物名が空でも購入できること' do
          expect(@customer_order).to be_valid
        end
      end

      context '購入がうまくいかない時' do
        it 'クレジットカードトークンが空では購入できないこと' do
          @customer_order.token = nil
          @customer_order.valid?
          expect(@customer_order.errors.full_messages).to include("Token can't be blank")
        end

        it '郵便番号が空では購入できないこと' do
          @customer_order.postal_code = nil
          @customer_order.valid?
          expect(@customer_order.errors.full_messages).to include("Postal code can't be blank")
        end

        it '郵便番号にハイフンがなけれが購入できないこと' do
          @customer_order.postal_code = "1234567"
          @customer_order.valid?
          expect(@customer_order.errors.full_messages).to include("Postal code Input correctly")
        end
        
        it '配送先の都道府県が空では購入できないこと' do
          @customer_order.shipping_origin_id = nil
          @customer_order.valid?
          expect(@customer_order.errors.full_messages).to include("Shipping origin Select")
        end
        
        it '市区町村が空では購入できないこと' do
          @customer_order.city = nil
          @customer_order.valid?
          expect(@customer_order.errors.full_messages).to include("City can't be blank")
        end
        
        it '番地が空では購入できないこと' do
          @customer_order.house_number = nil
          @customer_order.valid?
          expect(@customer_order.errors.full_messages).to include("House number can't be blank")
        end
        
        it '電話番号が空では購入できないこと' do
          @customer_order.phone_number = nil
          @customer_order.valid?
          expect(@customer_order.errors.full_messages).to include("Phone number can't be blank")
        end
        
        it '電話番号にはハイフンがあると購入できないこと' do
          @customer_order.phone_number = "090-123-1234"
          @customer_order.valid?
          expect(@customer_order.errors.full_messages).to include("Phone number can't be blank")
        end
      end
    end
  end
end
