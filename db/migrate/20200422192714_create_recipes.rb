class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
