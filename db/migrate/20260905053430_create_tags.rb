class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.references :recruitment, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
