class PackagesController < ApplicationController
$current_id = 0
  def new

  end

  def index
  	@packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
    $current_id = get_id
  end

  def add
  	@package = Package.find($current_id)
	@question = Question.find(params[:question_id])
	if @question.valid?
		@package.questions << @question
	else

	end
	redirect_to action:'show', id: $current_id
  end

  def delete
	
  end

  def get_id
	string = request.original_url
	string[-1,1]
  end

end
