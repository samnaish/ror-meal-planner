class AddImageToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :image, :string
    add_column :recipes, :string, :string
  end
end
