class Recipe < ApplicationRecord
  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

	has_many :steps, inverse_of: :recipe, dependent: :destroy
	accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

	def index
		@recipe = Recipe.all
		if params[:search]
			@recipe = Recipe.search(params[:search]).order("created_at DESC")
		else
			@recipe = Recipe.all.order("created_at DESC")
		end
	end

	def self.search(search)
		where("name LIKE ? OR ingredient LIKE ?", "%#{search}%", "%#{search}%")
	end

end
