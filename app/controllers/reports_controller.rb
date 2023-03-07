class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_repot_options, only: %i[ report_by_category report_by_dates ]

  def index
    categories = current_user.categories
    @category_options = categories.map { |c| [c.name, c.id] }
  end

  def report_by_category
    @category_reports = current_user.operations
      .reports_by_category(params[:start_date], params[:last_date], params[:operation_type])
      .map do |key, value|
        [Category.find(key).name, value]
      end
  end

  def report_by_dates
    @date_reports = current_user.operations
      .reports_by_dates(params[:start_date],
                        params[:last_date],
                        params[:operation_type],
                        params[:operation][:category_id]
                      )
  end

  private

  def set_repot_options
    @report_options = { start_date: params[:start_date],
      last_date: params[:last_date],
      operation_type: params[:operation_type]
    }
  end
end
