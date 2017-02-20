class QuestionsController < ApplicationController


  def index
    @questions = Question.all
  end
  def new
  end

  def create
    @question = Question.create()
    @answerA = @question.answers.new(content: params[:"A"], image: params[:"photoA"])
    if @answerA.save
      @answerB = @question.answers.new(content: params[:"B"], image: params[:"photoB"])
      if @answerB.save
        flash[:notice] = "Question Created Successfullly"
        redirect_to questions_path
      else
        flash[:alert] = "TRY AGAIN"
        redirect_to :back
      end
    else
      flash[:alert] = "TRY AGAIN"
      redirect_to :back
    end
  end


end
