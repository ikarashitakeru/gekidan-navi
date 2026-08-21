class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recruitment, null: false, foreign_key: true
      t.text :motivation
      t.integer :selection_status

      t.timestamps
    end
  end
end
