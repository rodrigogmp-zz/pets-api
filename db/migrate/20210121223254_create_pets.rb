class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.datetime :birthday_date
      t.string :breed
      t.integer :kind

      t.timestamps
    end
  end
end
