class Operation < ApplicationRecord

  belongs_to :category
  belongs_to :user

  validates :description, :operation_date, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  enum operation_type: [:outlay, :income]

  scope :operations_by_category, ->(category_id) { where(category_id: category_id) }

  scope :reports_by_category, ->(start_date, last_date, operation_type) {
    where(operation_date: (start_date..last_date), operation_type: operation_type)
    .group(:category_id)
    .sum(:amount)
  }

  scope :reports_by_dates, ->(start_date, last_date, operation_type, category_id) {
    where(operation_date: (start_date..last_date), operation_type: operation_type, category_id: category_id)
    .group(:operation_date)
    .sum(:amount)
  }
  # private
  # def convert(sum, from_currency = 'UAH', to_currency)
  #   fx = OpenExchangeRates::Rates.new
  #   fx.convert(sum, :from => from_currency, :to => to_currency)
  # end
end
