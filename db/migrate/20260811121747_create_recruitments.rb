class CreateRecruitments < ActiveRecord::Migration[8.0]
  def change
    create_table :recruitments do |t|
      t.references :theater, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.integer :capacity, null: false
      t.date :deadline, null: false
      t.string :activity_area, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
