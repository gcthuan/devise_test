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
      redirect_to questions_path, notice: "The question has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @question= Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to questions_path, notice: "The question has been successfully updated."
    else
      render action: "edit"
    end
  end

  private

    def question_params
	    params.require(:question).permit(:name, :body)
    end
  
end
