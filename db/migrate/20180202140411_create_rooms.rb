class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :password
      t.boolean :is_public
      t.integer :creator_id

      t.timestamps
    end
  end
end
