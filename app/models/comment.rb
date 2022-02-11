class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :work

   validates :content, work: true
end
