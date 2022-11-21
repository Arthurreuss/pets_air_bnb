class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :price
      t.integer :age
      t.integer :size
      t.text :description
      t.string :species

      t.timestamps
    end
  end
end
