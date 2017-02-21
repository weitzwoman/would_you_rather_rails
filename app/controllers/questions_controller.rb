class QuestionsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @questions = Question.all
  end
  def new
  end

  def create
    @question = Question.create()
    @answerA = @question.answers.new(content: params[:"A"], image: params[:PhotoA])
    if @answerA.save
      @answerB = @question.answers.new(content: params[:"B"], image: params[:PhotoB])
      if @answerB.save
        flash[:notice] = "Question Created Successfullly"
        respond_to do |format|
          format.html {redirect_to questions_path}
          format.js
        end
      else
        flash[:alert] = "TRY AGAIN"
        redirect_to :back
      end
    else
      flash[:alert] = "TRY AGAIN"
      redirect_to :back
    end
  end

  def close_form

  end


end
