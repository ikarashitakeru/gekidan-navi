class AddGenreToRecruitments < ActiveRecord::Migration[8.0]
  def change
    add_reference :recruitments, :genre, foreign_key: true
  end
end
