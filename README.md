# テーブル設計

## users テーブル

| Column          | Type    | Options                                       |
| --------------- | ------- | --------------------------------------------- |
| nickname        | string  | null: false                                   |
| email           | string  | null: false, unique: true, confirmation: true |
| password        | string  | null: false, length: { minimum: 6 }           |
| last_name       | string  | null: false                                   |
| first_name      | string  | null: false                                   |
| last_name_kana  | string  | null: false                                   |
| first_name_kana | string  | null: false                                   |
| birth_year      | integer | null: false                                   |
| birth_month     | integer | null: false                                   |
| birth_day       | integer | null: false                                   |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column           | Type       | Options                                                         |
| ---------------- | ---------- | --------------------------------------------------------------- |
| item_name        | string     | null: false, length: { maximum: 6 }                             |
| item_explain     | text       | null: false, length: { maximum: 1000 }                          |
| item_category_id | integer    | null: false                                                     |
| item_status_id   | integer    | null: false                                                     |
| ship_cost_id     | integer    | null: false                                                     |
| ship_area_id     | integer    | null: false                                                     |
| ship_days_id     | integer    | null: false                                                     |
| item_price       | integer    | null: false, greater_than_or_equal_to: 300, less_than: 10000000 |
| user             | references | null: false, foreign_key: true                                  |

### Association

- belongs_to :user
- has_one    :buy

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_number | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false, limit: 11         |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy