class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_place
  belongs_to :shipping_days
  has_many :comments, dependent: :destroy

  
  belongs_to :user
  has_one :order
  has_one_attached :image


  with_options presence: true do  
    validates :image
    validates :name
    validates :description
  end  

  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_place_id
    validates :shipping_days_id
  end


  validates :price, numericality: { with: /\A[0-9]+\z/, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'out of setting range' }
  
             
end


