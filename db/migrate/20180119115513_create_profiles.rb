class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :profile_picture_url
      t.integer :user_id

      t.timestamps
    end
  end
end
