class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.image :image
      t.text :description
      t.ingredients_attributes
      t.integer :user_id
      t.timestamps
    end
  end
end
