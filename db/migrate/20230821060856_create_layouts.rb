class CreateLayouts < ActiveRecord::Migration[7.0]
  def change
    create_table :layouts do |t|
      t.string :title
      t.integer :scale_ratio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
