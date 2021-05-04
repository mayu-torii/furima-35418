# README

## users テーブル

| Column           | Type     | Options     |
| -----------------| ---------| ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| family_name      | string   | null: false |
| first_name       | string   | null: false |
| family_name_kana | string   | null: false |
| first_name_kana  | string   | null: false |
| birthday         | string   | null: false |

## Association
- has_many :items
- has_one :destination



## itemsテーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | -------------------------------|
| image          | string     | null: false                    |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| shipping_fee   | string     | null: false                    |
| shipping_place | string     | null: false                    |
| shipping_days  | string     | null: false                    |
| price          | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |

## Association
- belongs_to :user




## destinationテーブル

| Column      | Type      | Options     |
| ----------- | --------- | ------------|
| postal_code | string    | null: false |
| prefecture  | string    | null: false |
| city        | string    | null: false |
| street      | string    | null: false |
| bulding     | string    |             |
| tephone     | string    | null: false |

## Association
- belongs_to :user
