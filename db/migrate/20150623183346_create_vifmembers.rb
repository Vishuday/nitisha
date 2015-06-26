# Migration to create Vifmembers table
class CreateVifmembers < ActiveRecord::Migration
  def change
    create_table :vifmembers do |t|
      t.references :virtualinterface, index: true, foreign_key: true
      t.references :interface, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
