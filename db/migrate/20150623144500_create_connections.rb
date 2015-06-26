class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :cabletype, index: true, foreign_key: true
      t.references :porta, index: true, foreign_key: true
      t.references :portb, index: true, foreign_key: true
      t.references :inverse, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
