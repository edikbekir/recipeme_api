class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :quantity
      t.string :name, null: false
      t.references :recipe, null: false

      t.timestamps
    end
  end
end
