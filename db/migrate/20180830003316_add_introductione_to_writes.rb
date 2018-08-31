class AddIntroductioneToWrites < ActiveRecord::Migration
  def change
    add_column :writes, :introduction, :string
  end
end
