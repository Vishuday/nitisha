class CreateVirtualinterfaces < ActiveRecord::Migration
  def change
    create_table :virtualinterfaces do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
