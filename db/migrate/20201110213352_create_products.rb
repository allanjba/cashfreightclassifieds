class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.string :location
      t.string :Condition
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
