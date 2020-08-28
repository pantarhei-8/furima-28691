# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| name         | string  | null: false |
| name_reading | string  | null: false |
| birth        | integer | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_image          | text       | null: false                    |
| item_name           | string     | null: false                    |
| item_text           | string     | null: false                    |
| category            | string     | null: false                    |
| status              | string     |                                |
| shipping_charger    | integer    | null: false                    |
| shipping_origin     | integer    | null: false                    |  #Active_hash?
| days_until_shipping | integer    | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :customers
- belongs_to :users

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :comments

## customers テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_price | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- has_one :customers_info
- belongs_to :items

## customers_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :customers
