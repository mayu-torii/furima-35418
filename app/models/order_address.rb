class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_number, :building_name, :order_id, :telephone, :user_id, :item_id, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street_number
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :token
  end

    

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, telephone: telephone, order_id: order.id)
  end
end