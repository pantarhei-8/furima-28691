require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("public/images/test_image.png")
    end
    
    describe '商品出品機能' do
      context '出品がうまくいく時' do
        it "image,item_name,item_text,category_id,status_id,shipping_charger_id,shipping_origin_id,days_until_shipping_id,priceが存在すれば出品できること" do
          expect(@item).to be_valid
        end
      end
      
      context '出品がうまくいかないとき' do
        it '出品画像が空では出品できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        
        it '商品名が空では出品できないこと' do
          @item.item_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it '商品の説明が空では出品できないこと' do
          @item.item_text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item text can't be blank")
        end

        it '商品のカテゴリーが空では出品できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end

        it '商品の状態が空では出品できないこと' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status Select")
        end

        it '配送料の負担が空では出品できないこと' do
          @item.shipping_charger_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charger Select")
        end

        it '発送元の地域が空では出品できないこと' do
          @item.shipping_origin_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping origin Select")
        end

        it '発送までの日数が空では出品できないこと' do
          @item.days_until_shipping_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Days until shipping Select")
        end

        it '販売価格が空では出品できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end

        it '販売価格が299円以下では出品できないこと' do
          @item.price = "299"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end

        it '販売価格が10,000,000円以上では出品できないこと' do
          @item.price = "10000000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end

        it '販売価格は半角数字以外では出品できないこと' do
          @item.price = "aAあＡ"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
      end
    end  
  end
end
