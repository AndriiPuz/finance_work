class RemoveNameFromOperations < ActiveRecord::Migration[7.0]
  def change
    remove_column :operations, :name, :string
  end
end
