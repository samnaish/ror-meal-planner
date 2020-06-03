class AddCookTimeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :cooktime, :integer
    add_column :recipes, :cooktimeGroup, :string
  end
end
