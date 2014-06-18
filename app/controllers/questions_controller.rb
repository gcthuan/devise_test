class QuestionsController < ApplicationController
  def new
  	@question = Question.new
  end

  def index
  	@questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
	@question = Question.new(question_params)
	if @question.save
	  flash[:success] = "You have successfully created a new question!"
	  redirect_to :action => 'index'
	else
	  render 'new'
	end
  end

  private

    def question_params
	    params.require(:question).permit(:name)
    end
  
end
