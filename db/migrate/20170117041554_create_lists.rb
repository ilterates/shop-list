class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
