class Recruitment < ApplicationRecord
  belongs_to :theater
  belongs_to :genre, optional: true

  has_many :applications, dependent: :destroy
  has_many :scouts, dependent: :destroy

  enum :status, {
    open: 0,
    closed: 1
  }
end