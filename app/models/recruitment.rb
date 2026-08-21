class Recruitment < ApplicationRecord
  belongs_to :theater
  has_many :applications, dependent: :destroy

  enum :status, {
    open: 0,
    closed: 1
  }
end