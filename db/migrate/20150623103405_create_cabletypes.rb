class CreateCabletypes < ActiveRecord::Migration
  def change
    create_table :cabletypes do |t|
      t.string :name
      t.references :conn1, index: true, foreign_key: true
      t.references :conn2, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
