class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
	def index
		@recipe = Recipe.all
  end

  def search
    if request.query_parameters[:search]
      @recipes = Recipe.where("name LIKE ?", "%" + request.query_parameters[:search] + "%")
    end
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
    redirect_to @recipe, notice: "succesfully deleted recipe"
  end

	private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(
        :name, :description,
        :ingredients_attributes => [:id, :content, :unit, :quantity, :_destroy],
        :steps_attributes => [:id, :direction, :_destroy])
    end



end
