class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def search
    if search_params[:search].present?
      @recipe = Recipe.search(params[:search])
    else
      @recipe = Recipe.all
    end
  end

  private

  def search_params
    params.permit(:recipe).permit(:name, :id, :search)
  end

end
