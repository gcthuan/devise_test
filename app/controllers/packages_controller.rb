class PackagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  $current_id = 0
  def new
    @package = Package.new
  end

  def index
  	@packages = Package.order(sort_column + " " + sort_direction)
  end

  def show
    @package = Package.find(params[:id])
    $current_id = get_id
  end

  def create
    @package = Package.new(package_params)
    if @package.save
      flash[:success] = "You have successfully created a new package!"
      redirect_to :action => 'index'
    else
      render 'new'
    end
  end

  def add
  	@package = Package.find($current_id)
	  @question = Question.find(params[:question_id])
	  if @question.valid?
		  @package.questions << @question
	  else
      z
	  end
	  redirect_to action:'show', id: $current_id
  end

  def unpackage
    @package = Package.find($current_id)
    @question = Question.find(params[:id])
    @package.questions.destroy(@question)
    redirect_to action:'show', id: $current_id
  end

  def delete
	
  end

  def get_id
	  id = request.original_url.split(/\/(\d{1,})/)
    id.last
  end

  private

    def package_params
      params.require(:package).permit(:name)
    end

    def sort_column
      Package.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
