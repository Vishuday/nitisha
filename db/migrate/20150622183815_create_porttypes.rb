class CreatePorttypes < ActiveRecord::Migration
  def change
    create_table :porttypes do |t|
      t.string :name
      t.references :connectortype, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
