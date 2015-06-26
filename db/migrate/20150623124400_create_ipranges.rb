class CreateIpranges < ActiveRecord::Migration
  def change
    create_table :ipranges do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :prefix
      t.references :parent, index: true

      t.timestamps null: false
    end
  end
end
