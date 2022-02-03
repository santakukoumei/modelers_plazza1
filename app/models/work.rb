class Work < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  # has_many :comments, dependent: :destroy

  validates :title, presence: true 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :concept, presence: true 
  validates :explanation, presence: true
  validates :image, presence: true
end
