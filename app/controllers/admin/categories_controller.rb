class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.all
    @user = current_user
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path(@category)
    else
      flash.now[:error] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  # def edit
  #   @users = User.all
  #   @categories = Category.all
  # end
  #
  # def update
  #   @category = Category.find(params[:id])
  #   @users = User.all
  #   @categories = Category.all
  #
  #   if @category.update(category_params)
  #     redirect_to admin_idea_path(@category)
  #   else
  #     flash.now[:error] = @categories.errors.full_messages.join(", ")
  #     render :edit
  #   end
  # end


  private
    def category_params
      params.require(:category).permit(:topic)
    end
end
