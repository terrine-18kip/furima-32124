class Item < ApplicationRecord
  with_options presence: true do
    validates :name,    length: { maximum: 40 }
    validates :explain, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :ship_cost_id
    validates :prefecture_id
    validates :schedule_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :ship_cost_id
    validates :prefecture_id
    validates :schedule_id
  end

  belongs_to       :user
  has_one_attached :image
  has_one          :order
  has_many         :messages

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :schedule

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
