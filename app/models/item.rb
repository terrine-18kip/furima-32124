class Item < ApplicationRecord
  validates :name,         presence: true, length: { maximum: 6 }
  validates :explain,      presence: true, length: { maximum: 1000 }
  validates :category_id,  presence: true
  validates :status_id,    presence: true
  validates :ship_cost_id, presence: true
  validates :ship_area_id, presence: true
  validates :ship_days_id, presence: true
  validates :price,        presence: true,
                           numericality: { greater_than_or_equal_to: 300, less_than: 10000000 }
  validates :user_id,      presence: true
  validates :image,        presence: true

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :day

end
