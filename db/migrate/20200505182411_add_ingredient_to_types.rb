class AddIngredientToTypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients, :type, foreign_key: true
  end
end
