class Operation < ApplicationRecord
  
  belongs_to :category
  belongs_to :user

  validates :description, :operation_date, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  enum operation_type: [:outlay, :income]

  scope :reports_by_category, ->(start_date, last_date, operation_type) {
    where(operation_date: (start_date..last_date), operation_type: operation_type)
    .group(:category_id)
    .sum(:amount)}

  scope :reports_by_dates, ->(start_date, last_date, operation_type, category_id) {
    where(operation_date: (start_date..last_date), operation_type: operation_type, category_id: category_id)
    .group(:operation_date)
    .sum(:amount)
  }
end
