class AnswersController < ApplicationController
  def show
  end
  def upvote

    @answer = Answer.find(params[:id])
    @question = @answer.question
    @question.answers.each do |a|
      a.get_upvotes.each do |vote|
        if current_user.id == vote.voter_id
          redirect_to questions_path

          flash[:alert] = " YOU CANT VOTE TWICE! FAKE NEWS!"
          return
        else
          @answer.upvote_by current_user
          redirect_to questions_path
        end
      end
    end
  end

end
