class Application < ApplicationRecord
  belongs_to :user
  belongs_to :recruitment

  enum :selection_status, {
    applied: 0,
    screening: 1,
    accepted: 2,
    rejected: 3
  }

  validates :motivation, presence: true

  validates :recruitment_id,
            uniqueness: { scope: :user_id, message: "にはすでに応募しています" }
end