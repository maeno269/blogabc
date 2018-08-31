class CreateWrites < ActiveRecord::Migration
  def change
    create_table :writes do |t|
        t.string      :name
        t.text        :text
        t.text        :image
        t.timestamps
    end
  end
end
