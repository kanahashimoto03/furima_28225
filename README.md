# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| --------                | ------ | ----------- |
| nickname                | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| password_confirmation   | string | null: false |
| name                    | string | null: false |
| name_reading            | string | null: false |
| birthday                | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :order_adress
- has_one  :credit_card

## items テーブル

| Column                  | Type        | Options     |
| --------                | ------      | ----------- |
| item_image              | string      | null: false |
| item_name               | string      | null: false |
| item_description        | text        | null: false |
| item_category           | string      | null: false |
| item_condition          | string      | null: false |
| shipping_charge         | string      | null: false |
| shipping_area           | string      | null: false |
| delivery_time           | string      | null: false |
| item_price              | string      | null: false |
| user                    | references  | null: false , foreign_key: true|


### Association

- belongs_to :user
- has_many :comments
- has_one :order_adress

## comments テーブル

| Column          | Type       | Options                        |
| ------          | ---------- | ------------------------------ |
| comment         | text       | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## credit_card テーブル

| Column                  | Type        | Options     |
| --------                | ------      | ----------- |
| card_number             | integer     | null: false |
| expire_year             | integer     | null: false |
| expire_month            | integer     | null: false |
| security_code           | integer     | null: false |
| user                    | references  | null: false, foreign_key: true |
| order_adress            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order_adress

## order_adress テーブル

| Column                  | Type       | Options     |
| --------                | ------     | ----------- |
| postal_code             | integer    | null: false |
| prefecture              | string     | null: false |
| city                    | string     | null: false |
| house_number            | string     | null: false |
| building_name           | string     |
| phone_number            | string     | null: false |
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :credit_card