require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての情報が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it '画像を添付しなければ登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'explainが空では登録できないこと' do
      @item.explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end

    it 'カテゴリーの情報がなければ登録できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    it '商品の状態の情報がなければ登録できないこと' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 0')
    end

    it '配送料の負担の情報がなければ登録できないこと' do
      @item.ship_cost_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship cost must be other than 0')
    end

    it '発送元の地域の情報がなければ登録できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship area must be other than 0')
    end

    it '発送までの日数の情報がなければ登録できないこと' do
      @item.schedule_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Schedule must be other than 0')
    end

    it '価格が空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が¥300未満では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が¥10,000,000以上では登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end

    it '価格が全角では登録できないこと' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'userが紐ついていないと登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
