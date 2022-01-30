# DB 設計

## users テーブル

| Column             | Type     | Options                   |
|--------------------|----------|---------------------------|
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| name               | string   | null: false               |
| profile            | text     | null: false               |

### Association

* has_many :works
* has_many :comments

## works テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| title         | string     | null: false                    |
| category_id   | integer    | null: false                    |
| concept       | text       | null: false                    |
| explanation   | text       | null: false                    |#説明
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| work        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :work
- belongs_to :user