class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.integer :rating
      t.string :measurement
      t.integer :quantity
      t.references :type

      t.timestamps
    end
  end
end
