class CreateRegisteredItems < ActiveRecord::Migration[7.0]
  def change
    create_table :registered_items do |t|
      t.integer :x
      t.integer :y
      t.integer :rotation
      t.integer :length
      t.integer :width
      t.references :item, null: false, foreign_key: true
      t.references :layout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
