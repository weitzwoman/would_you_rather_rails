class AnswersController < ApplicationController
  before_action :authenticate_user!

  def show
  end
  def upvote
    canvote = true
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @question.answers.each do |a|
      a.get_upvotes.each do |vote|
        if current_user.id == vote.voter_id
          canvote = false
          flash[:notice] = "YOU CANT VOTE TWICE! FAKE NEWS! VOTER FRAUD!"
          redirect_to questions_path
          return
        else
          canvote = true
        end
      end
    end
    if canvote == true
      @answer.upvote_by current_user
      flash[:notice] = "Thanks for voting #{current_user.name}"
      redirect_to questions_path
    end
  end

end
