require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての項目が入力されていれば登録できる" do
        expect(@user).to be_valid
      end

    end
    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "encrypted_passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "profileが空では登録できない" do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Profile can't be blank"
      end

      it "重複したメールアドレスは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it "メールアドレスに@を含まない場合は登録できない" do
        @user.email = 'abcabc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it "パスワードが6文字未満では登録できない" do
        @user.password = '012atz'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "英字のみのパスワードでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "数字のみのパスワードでは登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "全角文字を含むパスワードでは登録できない" do
        @user.password = '１11111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "パスワードとパスワード（確認用）が不一致だと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
