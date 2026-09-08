class AddScoreToRecruitments < ActiveRecord::Migration[8.0]
  def change
    add_column :recruitments, :score, :decimal, precision: 5, scale: 3
  end
end
