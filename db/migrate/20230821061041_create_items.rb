class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :d_length
      t.integer :d_width
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
