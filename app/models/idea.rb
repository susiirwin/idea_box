class Idea < ActiveRecord::Base
  belongs_to :user

  def new
    @categories = Category.all
    @idea = Idea.new
  end

  def create
    @categories = Category.all
    @idea = current_user.ideas.new(idea_params)

    if @idea.save
      flash.now[:notice] = "You have created a Great Idea!"
      redirect_to user_ideas_path(current_user)
    else
      flash.now[:error] = @ideas.errors.full_messages.join(", ")
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
