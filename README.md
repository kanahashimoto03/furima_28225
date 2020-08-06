# テーブル設計

## users テーブル

| Column                  | Type     | Options     |
| --------                | ------   | ----------- |
| nickname                | string   | null: false |
| email                   | string   | null: false |
| password                | string   | null: false |
| password_confirmation   | string   | null: false |
| family_name             | string   | null: false |
| last_name               | string   | null: false |
| family_name_reading     | string   | null: false |
| last_name_reading       | string   | null: false |
| birth_year              | date     | null: false |
| birth_month             | date     | null: false |
| birth_date              | date     | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column                  | Type        | Options     |
| --------                | ------      | ----------- |
| item_name               | string      | null: false |
| item_description        | text        | null: false |
| item_category_id        | integer     | null: false |
| item_condition_id       | integer     | null: false |
| shipping_charge_id      | integer     | null: false |
| shipping_area_id        | integer     | null: false |
| delivery_time_id        | integer     | null: false |
| item_price              | integer     | null: false |
| user                    | references  | null: false , foreign_key: true|


### Association

- belongs_to :user
- has_many :comments
- has_one :order_adress
- has_one :order_history

## comments テーブル

| Column          | Type       | Options                        |
| ------          | ---------- | ------------------------------ |
| comment         | text       | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## order_adresses テーブル

| Column                  | Type       | Options     |
| --------                | ------     | ----------- |
| postal_code             | integer    | null: false |
| prefecture_id           | integer    | null: false |
| city                    | string     | null: false |
| house_number            | string     | null: false |
| building_name           | string     |
| phone_number            | string     | null: false |
| item                    | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## order_history テーブル

| Column                  | Type       | Options     |
| --------                | ------     | ----------- |
| price                   | integer    | null: false |
| chekcked                | boolean    | null: false |
| user                    | references | null: false |
| item                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


