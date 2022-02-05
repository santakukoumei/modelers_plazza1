# アプリケーション名
MODELERS PLAZZA

# アプリケーション概要
モデラーの方々が作成した作品の画像、作成中でのエピソードや技術を共有できるアプリケーション

# アプリケーションURL
https://modelers-plazza.herokuapp.com/

# テスト用アカウント
ID/Pass
ID/test
Pass/1234

# 利用方法
ユーザーアカウント登録し、作成した作品の画像、ジャンル、作品コンセプト、作品説明の必要項目入力し作品の投稿と、他の人が作成した作品にコメントすることもできます。

# 目指した課題解決達
ビギナーからベテランまで、さまざまなジャンルの模型作品の発表と、作成中のエピソード、技術的なお悩みを解決できるようにモデラーさん交流の場にしてもらいたいと思い作成しました。

# 要件定義
1.ユーザー登録
2.作品投稿
3.投稿内容編集
4.コメント投稿
5.作品詳細


# DB 設計
ER図
https://gyazo.com/a02f18494a668208d36019d648cbc3ca



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