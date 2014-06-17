class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character, null: false
      t.string :actor, null: false
      t.string :description
    end
  end
end
