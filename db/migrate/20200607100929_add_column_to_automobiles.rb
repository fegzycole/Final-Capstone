class AddColumnToAutomobiles < ActiveRecord::Migration[6.0]
  def change
    add_column :automobiles, :imageUrl, :text
  end
end
