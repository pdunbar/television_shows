class AddTelevisionShowToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :television_show_id, :integer, null: false
  end
end
