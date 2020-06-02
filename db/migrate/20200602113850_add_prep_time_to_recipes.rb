class AddPrepTimeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :time, :integer
    add_column :recipes, :integer, :string
    add_column :recipes, :timeGroup, :string
  end
end
