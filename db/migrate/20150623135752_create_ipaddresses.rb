class CreateIpaddresses < ActiveRecord::Migration
  def change
    create_table :ipaddresses do |t|
      t.string :address
      t.references :parent, index: true, foreign_key: true
      t.references :interface, index: true, foreign_key: true
      t.references :virtualinterface, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
