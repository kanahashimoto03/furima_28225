class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charge

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :item_description
    validates :delivery_time_id
    validates :item_category_id
    validates :item_condition_id
    validates :shipping_area_id
    validates :shipping_charge_id
    validates :item_price
  end

  with_options numericality: { other_than: 1 } do
    validates :delivery_time_id
    validates :item_category_id
    validates :item_condition_id
    validates :shipping_area_id
    validates :shipping_charge_id
  end

  validates :item_price, numericality: { greater_than: 300, less_than: 9999999, message:'is out of Range' }

  belongs_to :user

end
 