class AddLikesToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :likes, :integer, default: 0
  end
end
