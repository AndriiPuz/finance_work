class Category < ApplicationRecord
  belongs_to :user
  has_many :operations, dependent: :destroy

  validates :name, :description, presence: true
  validates :name,  uniqueness: true
end
