class CreateTheaters < ActiveRecord::Migration[8.0]
  def change
    create_table :theaters do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.text :introduction
      t.string :activity_area, null: false
      t.string :website_url

      t.timestamps
    end

    add_index :theaters, :email, unique: true
  end
end
