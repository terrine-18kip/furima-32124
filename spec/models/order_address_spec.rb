require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての情報が存在すれば登録できること' do
      expect(@order_address).to be_valid
    end

    it '郵便番号が空では登録できないこと' do
      @order_address.postal_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal number can't be blank")
    end

    it '郵便番号にハイフンがないと登録できないこと' do
      @order_address.postal_number = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal number is invalid")
    end

    it '都道府県が選択されていないと登録できないこと' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it '市区町村が空では登録できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では登録できないこと' do
      @order_address.street = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street can't be blank")
    end

    it '建物名が空でも登録できること' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it '電話番号が空では登録できないこと' do
      @order_address.phone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号にハイフンがあると登録できないこと' do
      @order_address.phone = '052-123-4567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is invalid")
    end

    it '電話番号が11桁以内でないと登録できないこと' do
      @order_address.phone = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is invalid")
    end

  end
end
