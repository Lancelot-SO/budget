class ChangeColumnDataTypeIcon < ActiveRecord::Migration[7.0]
  def change
    change_column :groups, :icon, :text
  end
end
