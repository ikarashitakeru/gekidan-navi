class Scout < ApplicationRecord
  belongs_to :theater
  belongs_to :user
  belongs_to :recruitment

  enum :status, {
    sent: 0,
    accepted: 1,
    declined: 2
  }

  validates :user_id,
            uniqueness: {
              scope: [:theater_id, :recruitment_id],
              message: "にはこの募集ですでにスカウトを送信しています"
            }

  validates :message, presence: true
end