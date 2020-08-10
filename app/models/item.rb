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
    validates :delivery_time
    validates :item_category
    validates :item_condition
    validates :shipping_area
    validates :shipping_charge
    validates :item_price
  end

  with_options numericality: { other_than: 1 } do
    validates :delivery_time_id
    validates :item_category_id
    validates :item_condition_id
    validates :shipping_area_id
    validates :shipping_charge_id
  end

  belongs_to :user

end
