require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる時' do
      it 'nickname, password, password_confir_mation, email, family_name, given_name, family_name_kana, given_name_kana, birth があれば登録できる' do
        expect(@user).to be_valid
      end

      it 'password, password_confirmationが6文字以上で英数字半角両方含めばば登録できる' do
        @user.password = '0a0a0a'
        @user.password_confirmation = '0a0a0a'
        expect(@user).to be_valid
      end
      # 上記は不要な気がする。。。
      it 'ユーザー本名は、全角での入力が必須であること' do
        @user.family_name = '山田'
        @user.given_name = '花子'
        expect(@user).to be_valid
      end
      # 上記も不要な気がする。。。

      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana = 'ヤマダ'
        @user.given_name_kana = 'ハナコ'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録ができないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailがからでは登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailに@を含まないと登録できない' do
        @user.email = 'kazukazu'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordがからでは登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'ABCD１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'family_nameがからでは登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it 'given_nameがからでは登録できない' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Given name can't be blank"
      end

      it 'family_name_kanaがからでは登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end

      it 'given_name_kanaがからでは登録できない' do
        @user.given_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Given name kana can't be blank"
      end

      it 'birthがなければ登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end

      it '重複したemailが存在すれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordが英語だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'family_nameは半角では登録できない' do
        @user.family_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name is invalid'
      end
      it 'given_nameは半角では登録できない' do
        @user.given_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Given name is invalid'
      end

      it 'family_name_kanaは半角では登録できない' do
        @user.family_name_kana = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana is invalid'
      end
      it 'given_name_kanaは半角では登録できない' do
        @user.given_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Given name kana is invalid'
      end
    end
  end
end
