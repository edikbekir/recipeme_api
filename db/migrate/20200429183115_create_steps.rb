class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.references :recipe, null: false

      t.timestamps
    end
  end
end
