class PackagesController < ApplicationController

  def new
  end

  def index
  	@packages = Question.all
  end

  def show
    @package = Package.find(params[:id])
  end

end
