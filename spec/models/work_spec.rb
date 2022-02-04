require 'rails_helper'

RSpec.describe Work, type: :model do
  before do
    @work= FactoryBot.build(:work)
  end
  describe "投稿機能" do
    context '投稿できるとき' do
      it "全ての項目が入力されていれば出品できる" do
        expect(@work).to be_valid
      end
    end
    context '投稿できないとき' do
      it "userが紐付いていなければ出品できない" do
        @work.user = nil
        @work.valid?
        expect(@work.errors.full_messages).to include "User must exist"
      end
      it "imageが空だと出品できない" do
        @work.image = nil
        @work.valid?
        expect(@work.errors.full_messages).to include "Image can't be blank"
      end
      it "titleが空だと出品できない" do
        @work.title = ''
        @work.valid?
        expect(@work.errors.full_messages).to include "Title can't be blank"
      end
      it "category_idが未選択（1）では出品できない" do
        @work.category_id = '1'
        @work.valid?
        expect(@work.errors.full_messages).to include "Category can't be blank"
      end
      it "conceptが空では出品できない" do
        @work.concept = ''
        @work.valid?
        expect(@work.errors.full_messages).to include "Concept can't be blank"
      end
      it "explanationが空では出品できない" do
        @work.explanation = ''
        @work.valid?
        expect(@work.errors.full_messages).to include "Explanation can't be blank"
      end
    end
  end
end
