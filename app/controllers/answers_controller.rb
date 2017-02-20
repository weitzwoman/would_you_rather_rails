class AnswersController < ApplicationController
  def show
  end
  def upvote
    @answer = Answer.find(params[:id])
    @answer.upvote_by current_user
    redirect_to :back
  end

end
