class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @q = current_user.categories.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    categories = @q.result(distinct: true)
    @pagy, @categories = pagy(categories)
  end

  def show
    add_breadcrumb "Всі категорії", categories_path
    add_breadcrumb "редагувати", edit_category_url(@category)
  end

  def new
    @category = current_user.categories.new
  end

  def edit
    add_breadcrumb "Всі категорії", categories_path
    add_breadcrumb "Перейти до категорії", category_url(@category)
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Категорія була успішно створена." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Категорія була успішно редагована." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Категорія була успішно видалена" }
    end
  end

  private

    def set_category
      @category = Category.find(params[:id]) rescue not_found
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end
end
