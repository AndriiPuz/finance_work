class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :set_category_options, only: %i[ new edit create ]
  # before_action :set_operation_types, only: %i[ new edit ]

  # GET /operations or /operations.json
  def index
    @pagy, @operations = pagy(pagy_options)
    @categories = current_user.operations.collect { |o| [o.category.name, o.category.id] }.uniq
  end

  # GET /operations/1 or /operations/1.json
  def show
    add_breadcrumb "Всі транзакції", operations_path
    add_breadcrumb "редагувати", edit_operation_url(@operation)
  end

  # GET /operations/new
  def new
    # @category_options = current_user.categories.map { |c| [c.name, c.id]}
    @operation = current_user.operations.new

  end

  # GET /operations/1/edit
  def edit
    add_breadcrumb "Всі транзакції", operations_path
    add_breadcrumb "Перейти до транзакції", operation_url(@operation)
  end

  # POST /operations or /operations.json
  def create
    # @category_options = current_user.categories.map { |c| [c.name, c.id]}
    @operation = Operation.new(operation_params)
    @operation.user = current_user

    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def pagy_options
      params[:operation] == nil ? current_user.operations : current_user.operations.operations_by_category(params[:operation][:category_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    def set_category_options
      @category_options = current_user.categories.map { |c| [c.name, c.id]}
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:name, :operation_type, :amount, :operation_date, :description, :category_id)
    end
end
