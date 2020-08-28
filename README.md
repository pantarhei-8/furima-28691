# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| first_name         | string  | null: false |
| first_name_reading | string  | null: false |
| name               | string  | null: false |
| name_reading       | string  | null: false |
| birth              | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :customers

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_image          | text       | null: false                    |
| item_name           | string     | null: false                    |
| item_text           | text       | null: false                    |
| category            | integer    | null: false                    |
| status              | integer    |                                |
| shipping_charger    | integer    | null: false                    |
| shipping_origin     | integer    | null: false                    |
| days_until_shipping | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_one    :customers
- belongs_to :user

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## customers テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :customers_address

## customers_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| customer      | references | null: false, foreign_key: true |

### Association

- belongs_to   :customer
