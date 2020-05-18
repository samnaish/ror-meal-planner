class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipe = Recipe.all
  end

  def search
    @recipes = Recipe.where("name LIKE ?", "%" + search_params[:search] + "%")
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

   def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Successfully created"
    else
      render 'new'
    end
  end

 def update
      if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
		end
  end

   def destroy
    @recipe.destroy
  end

	private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(
        :name, :description,
        :ingredients_attributes => [:id, :content, :_destroy],
        :steps_attributes => [:id, :direction, :_destroy])
    end

    def search_params
      params.permit(:recipe, :search).permit(:name, :id)
    end

end
