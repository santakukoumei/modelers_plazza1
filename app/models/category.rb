class Category < ActiveHash::Base
  self.data = [
    { id: 1, genre: 'カテゴリー選択' },
    { id: 2, genre: 'ロボット' },
    { id: 3, genre: 'ミリタリー' },
    { id: 4, genre: 'カーモデル' },
    { id: 5, genre: '鉄道模型' },
    { id: 6, genre: 'フィギュア' },
    { id: 7, genre: 'キャラクターモデル' },
    { id: 8, genre: 'ジオラマ' },
    { id: 9, genre: 'フルスクラッチ（オリジナル）' },
    { id: 10, genre: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :works

end
