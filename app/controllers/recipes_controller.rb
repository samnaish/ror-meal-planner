class RecipesController < ApplicationController

	def index
		@recipe = Recipe.all
	end

  def show
    @recipe = Recipe.includes(:ingredients).find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def edit
  end

  def create
    @recipe = @current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Successfully created new recipe"
    else
      render 'new'
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully deleted.'
	end

	private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :image, :description,ingredients_attributes: [:id, :name, :_destroy])
    end

    def return_to_index
      redirect_to recipes_url, notice: 'Recipe not found.'
		end

		def find_recipe
			@recipe = Recipe.find(params[:id])
		end

end
