class RemoveNameFromWrites < ActiveRecord::Migration
  def change
    remove_column :writes, :name, :string
  end
end
