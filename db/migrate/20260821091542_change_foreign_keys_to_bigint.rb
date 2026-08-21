class ChangeForeignKeysToBigint < ActiveRecord::Migration[8.0]
  def change
    change_column :recruitments, :theater_id, :bigint
    change_column :applications, :user_id, :bigint
    change_column :applications, :recruitment_id, :bigint
  end
end