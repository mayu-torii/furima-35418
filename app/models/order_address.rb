class OrderAdress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :street_number, :building_name, :telephone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_number
    validates :telephone, format: { with: /\A[0-9]{11}\z/, message: 'Input only number' }
  do
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Adress.create(postal_code: postal_code, prefecture: prefecture, city: city, street_number: street_number, building_name: building_name, telephone: telephone, order_id: order.id)
  end
end