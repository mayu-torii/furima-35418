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
- has_many :oders
- has_many :comments


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
- has_one :oder
- has_many :comments


## adressテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| street_number     | string     | null: false                    |
| building_name     | string     |                                |
| telephone         | string     | null: false                    |
| oder              | references | null: false, foreign_key: true |


## Association
- belongs_to :order




## orderテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :adress




## commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| text      | rext       | null: false

## Association
- belongs_to :user
- belongs_to :item