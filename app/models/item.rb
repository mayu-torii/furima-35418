class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase_history

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_place_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, presence: true

end
