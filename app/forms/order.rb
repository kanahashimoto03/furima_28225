class Order

  include ActiveModel::Model 
  attr_accessor :postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' } 
  
  def save
    OrderHistory.create(user_id: user_id, item_id: item_id)
    OrderAdress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end

end
