class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :set_category_options, only: %i[ new edit create ]

  def index
    @pagy, @operations = pagy(pagy_options)
    @categories = current_user.operations.includes([:category]).collect { |o| [o.category.name, o.category.id] }.uniq
    @category_exist = current_user.categories.count > 0 ? true : false
  end

  def show
    add_breadcrumb "Всі транзакції", operations_path
    add_breadcrumb "редагувати", edit_operation_url(@operation)
  end

  def new
    @operation = current_user.operations.new
  end

  def edit
    add_breadcrumb "Всі транзакції", operations_path
    add_breadcrumb "Перейти до транзакції", operation_url(@operation)
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.user = current_user

    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation), notice: "Операція була успішно створена." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: "Операція була успішно редагована." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: "Операція була успішно видалена." }
    end
  end

  private

    def pagy_options
      params[:operation] == nil ? current_user.operations : current_user.operations.operations_by_category(params[:operation][:category_id])
    end

    def set_operation
      @operation = Operation.find(params[:id]) rescue not_found
    end

    def set_category_options
      @category_options = current_user.categories.map { |c| [c.name, c.id]}
    end

    def operation_params
      params.require(:operation).permit(:name, :operation_type, :amount, :operation_date, :description, :category_id)
    end
end
