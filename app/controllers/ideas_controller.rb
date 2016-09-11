class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def index
    @ideas = current_user.ideas
  end

  def create
    @categories = Category.all
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
    
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :text)

  end
end
