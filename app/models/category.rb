class Category < ActiveHash::Base
  self.data = [
    { id: 1, genre: 'カテゴリー選択' },
    { id: 2, genre: 'ロボット' },
    { id: 3, genre: 'ミリタリー' },
    { id: 4, genre: 'カーモデル' },
    { id: 5, genre: 'バイクモデル' },
    { id: 6, genre: '鉄道模型' },
    { id: 7, genre: 'フィギュア' },
    { id: 8, genre: 'キャラクターモデル' },
    { id: 9, genre: 'ジオラマ' },
    { id: 10, genre: 'フルスクラッチ（オリジナル）' },
    { id: 11, genre: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :works

end
