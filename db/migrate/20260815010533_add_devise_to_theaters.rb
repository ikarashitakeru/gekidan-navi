class AddDeviseToTheaters < ActiveRecord::Migration[8.0]
  def change
    add_column :theaters, :reset_password_token, :string
    add_column :theaters, :reset_password_sent_at, :datetime
    add_column :theaters, :remember_created_at, :datetime

    add_index :theaters, :reset_password_token, unique: true
  end
end