class RecipesController < ApplicationController

	def index
		@recipe = Recipe.all
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
    respond_to do |format|
      if @recipe.save
        format.html {redirect_to @recipe, notice: "Successfully created new recipe"}
        format.json {render :show, status: :created, location: @recipe}
      else
        format.html{render 'new'}
        format.json{render json: @recipe.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html {render 'edit'}
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url,
      notice: 'Recipe was successfully deleted.' }
      format.json { head :no_content }
    end
	end

	private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :image, :description, ingredients_attributes:[:id, :content, :_destroy],
      step_attributes:[:id, :direction, :destroy])
    end

end
