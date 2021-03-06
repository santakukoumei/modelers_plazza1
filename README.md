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
1.機能
1-1.ユーザー登録, 1-2.作品投稿, 1-3.投稿内容編集,1-4.コメント投稿, 1-5.作品詳細. 1-6.Q&A欄

2.目的
2-1.アプリケーション利用のアカウント登録
2-2.自身の作成した作品の投稿
2-3.投稿した内容の編集
2-4.他の人が投稿した作品にコメントできる
2-5.自身または他の人が投稿した作品詳細を閲覧
2-6.作品製作での技術的な質問と回答ができる

3.詳細
3-1.アプリ利用のためのアカウントを登録をする
3-2.作品のタイトル、画像、ジャンル、コンセプト、説明を投稿できる
3-3.投稿したタイトル、画像、ジャンル、コンセプト、説明の内容を編集できる
3-4.他の人が投稿した作品にコメントができる
3-5.自身または他の人が投稿した作品詳細（タイトル、画像、ジャンル、コンセプト、説明）を閲覧ができる
3-6.質問投稿と投稿に対して回答ができる

4.ストーリー(ユースケース)
4-1-1.ユーザーアカウントの登録方法を「手打ち入力」、「Googleアカウントを利用」、SNSアカウントの利用可能
4-1-2.SNSアカウントを選択した場合、既にパスワードは入力されてる状態で表示される
4-2-1.作品の画像と制作のエピソードや技術を投稿する
4-2-2.投稿に必要な情報を入力後に「保存」を押すと投稿内容が保存される
4-3-1.ログインしていのが投稿者である時、詳細画面の「編集」をクリックすると編集画面へ遷移する
4-3-2.投稿済みの内容の編集後に「保存」を押すと編集された投稿内容が更新される
4-4-1.投稿された作品にコメントを書き込むことができる。
4-5-1.投稿一覧の画像をクリックすると、その作品詳細画面へ遷移する
4-5-2.投稿者名をクリックすると、その作品詳細画面へ遷移する
4-6-1.「Q&A欄」をクリックすると、質問入力、質問一覧画面へ遷移する
4-6-2.質問欄をクリックすると、質問内容詳細と回答入力フォームに遷移する
4-6-3.回答内容を入力し「回答」を押すと回答内容が保存される。

# 実装した機能
作品投稿機能
[![Image from Gyazo](https://i.gyazo.com/bf06bb090990b27382118f504022bf7a.gif)](https://gyazo.com/bf06bb090990b27382118f504022bf7a)

作品詳細機能
[![Image from Gyazo](https://i.gyazo.com/ebe697ad7f122a5d8e16fd530dd9dbd9.gif)](https://gyazo.com/ebe697ad7f122a5d8e16fd530dd9dbd9)

# DB 設計
ER図
[![Image from Gyazo](https://i.gyazo.com/a02f18494a668208d36019d648cbc3ca.gif)](https://gyazo.com/a02f18494a668208d36019d648cbc3ca)

# 実装予定の機能
Q&A欄 作品製作での技術的な質問と回答ができる。
*「Q&A欄」をクリックすると、質問入力、質問一覧画面へ遷移する。
*質問欄をクリックすると、質問内容詳細と回答入力フォームに遷移する。
*回答内容入力し「回答」を押すと回答内容が保存される。

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