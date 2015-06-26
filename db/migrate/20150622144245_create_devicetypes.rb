class CreateDevicetypes < ActiveRecord::Migration
  def change
    create_table :devicetypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
