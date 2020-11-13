require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての情報が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
    end

    it 'emailが空では登録できないこと' do
    end

    it '重複したemailが存在する場合登録できないこと' do
    end

    it '@を含まないemailは登録できないこと' do
    end

    it 'passwordが空では登録できないこと' do
    end

    it 'passwordが6文字以上であれば登録できること' do
    end

    it 'passwordが5文字以下であれば登録できないこと' do
    end

    it 'passwordが半角英数字混合でなければ登録できないこと' do
    end

    it 'passwordとencrypted_passwordが不一致では登録できないこと' do
    end

    it 'last_nameが空では登録できないこと' do
    end

    it 'first_nameが空では登録できないこと' do
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
    end

    it 'last_name_kanaが空では登録できないこと' do
    end

    it 'first_name_kanaが空では登録できないこと' do
    end

    it 'last_name_kanaが全角（カタカナ）でなければ登録できないこと' do
    end

    it 'first_name_kanaが全角（カタカナ）でなければ登録できないこと' do
    end

    it 'birthdayが空では登録できないこと' do
    end

  end
end
