class User < ApplicationRecord
  has_many :expenses, foreign_key: :user_id, dependent: :destroy
  has_many :groups, foreign_key: :user_id

  validates_uniqueness_of :username
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }
end
