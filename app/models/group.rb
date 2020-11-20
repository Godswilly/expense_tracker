class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :expense_groups

  has_many :expenses, through: :expense_groups

  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  scope :asc, -> { order('name ASC') }
end
