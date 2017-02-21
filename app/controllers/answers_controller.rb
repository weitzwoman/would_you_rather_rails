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
          respond_to do |format|
            flash.now[:notice] = "YOU CANT VOTE TWICE! FAKE NEWS! VOTER FRAUD!"
            format.html {redirect_to questions_path}
            format.js
          end
          return
        else
          canvote = true
        end
      end
    end
    if canvote == true
      @answer.upvote_by current_user
      respond_to do |format|
        flash.now[:notice] = "Thanks for voting #{current_user.name}"
        format.html {redirect_to questions_path}
        format.js
      end
    end
  end

end
