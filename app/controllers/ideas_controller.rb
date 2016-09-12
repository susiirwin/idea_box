class IdeasController < ApplicationController

  def new
    @idea = current_user.ideas.new
    @categories = Category.all
  end

  def index
    @ideas = current_user.ideas
  end

  def create
    # @categories = Category.all
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Awesome idea has been created!"
      redirect_to user_ideas_path(current_user)
    else
      flash.now[:error] = @idea.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
    @categories = Category.all
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to user_ideas_path(current_user)
    else
      # flash.now[:error] = @ideas.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "You have removed that idea from the Idea Box."
    redirect_to user_ideas_path(current_user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :thought, :user_id)

  end
end
