class OrderAdress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :street_number, :building_name, :telephone, :user_id, :item_id

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end