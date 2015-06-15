class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id

    if @idea.save
      redirect_to current_user
    else
      flash.notice = 'Re-enter Idea'
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    flash.notice = "You're idea has been updated"
    redirect_to current_user
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash.notice = "You're idea has been deleted"
    redirect_to current_user
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description)
  end
end
