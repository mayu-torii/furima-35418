# README

## users テーブル

| Column             | Type     | Options                   |
| -------------------| ---------| ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday           | date     | null: false               |

## Association
- has_many :items
- has_many :purchase_histories


## itemsテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| shipping_fee_id   | integer    | null: false                    |
| shipping_place_id | integer    | null: false                    |
| shipping_days_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :purchase_history



## destinationテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| shipping_place_id | integer    | null: false                    |
| city              | string     | null: false                    |
| street            | string     | null: false                    |
| bulding           | string     |                                |
| tephone           | string     | null: false                    |
| purchase_history  | references | null: false, foreign_key: true |


## Association
- belongs_to :purchase_history




## purchase_historyテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :destination