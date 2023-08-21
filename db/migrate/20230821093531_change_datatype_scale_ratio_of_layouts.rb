class ChangeDatatypeScaleRatioOfLayouts < ActiveRecord::Migration[7.0]
  def change
    change_column :layouts, :scale_ratio, :float
  end
end
