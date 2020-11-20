class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :street, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :street
    validates :phone, format: { with: /\A(0{1}\d{9,10})\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone, order_id: order.id)
  end
end