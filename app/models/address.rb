class Address < ApplicationRecord
  POST_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_REGEX = /^(0{1}\d{9,10})$/.freeze

  with_options presence: true do
    validates :postal_number, format: { with: POST_REGEX }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :street
    validates :phone, format: { with: PHONE_REGEX }
  end

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
