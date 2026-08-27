class CreateScouts < ActiveRecord::Migration[8.0]
  def change
    create_table :scouts do |t|
      t.references :theater, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :recruitment, null: false, foreign_key: true
      t.text :message
      t.integer :status

      t.timestamps
    end
  end
end
