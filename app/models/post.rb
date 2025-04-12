class Post < ApplicationRecord
  belongs_to :admin_user
  validates :admin_user, presence: true
  has_many :comments, dependent: :destroy
  validates :tittle, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 20 }
  validates :category, presence: true, inclusion: { in: [ "Food", "Travel", "Lifestyle", "Tech", "Health" ] }
end
