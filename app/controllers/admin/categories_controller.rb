class Admin::CategoriesController < ApplicationController
  before_action :set_users, only: [:update, :edit, :create, :new]
  before_action :set_categories, only: [:update, :edit, :create, :new]

  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      flash.now[:error] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_idea_path(@category)
    else
      flash.now[:error] = @categories.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:topic)
  end

  def set_users
    @users = User.all
  end

  def set_categories
    @categories = Category.all
  end

end
