require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
    
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nickname,email,password,password_confirmation,first_name,name,first_name_reading,name_reading,birthが存在すれば登録できること" do
          expect(@user).to be_valid
        end

        it "passwordが6文字以上かつ半角英数字混合なら登録できること" do
          @user.password = "abc123"
          @user.password_confirmation = "abc123"
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空では登録できないこと" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        
        it "重複したnicknameが存在する場合は登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.nickname = @user.nickname
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Nickname has already been taken")
        end
        
        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailが@がなければ登録できないこと" do
          @user.email = "sample.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        
        it "重複したemailが存在する場合は登録できないこと" do
          @user.save
          # another_user = FactoryBot.build(:user, email: @user.email)
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        
        it "passwordが空では登録できないこと" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        
        it "passwordが5文字以下では登録できないこと" do
          @user.password = "aa345"
          @user.password_confirmation = "aa345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        
        it "passwordは半角英数字混合でないと登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
        
        it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
          @user.password = "abc123"
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
        it "first_nameが空では登録できないこと" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと" do
          @user.first_name = "Yasai"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Full-width characters")
        end
        
        it "nameが空では登録できないこと" do
          @user.name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end
        
        it "nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと" do
          @user.name = "Tarou"
          @user.valid?
          expect(@user.errors.full_messages).to include("Name Full-width characters")
        end
        
        it "first_name_readingが空では登録できないこと" do
          @user.first_name_reading = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading can't be blank")
        end
        
        it "first_name_readingがカタカナ以外では登録できないこと" do
          @user.first_name_reading = "野菜たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters")
        end
        
        it "name_readingが空では登録できないこと" do
          @user.name_reading = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Name reading can't be blank")
        end
        
        it "name_readingがカタカナ以外では登録できないこと" do
          @user.name_reading = "野菜たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("Name reading Full-width katakana characters")
        end
        
        it "birthが空では登録できないこと" do
          @user.birth = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth can't be blank")
        end
      end
    end
  end
end
