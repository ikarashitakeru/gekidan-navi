class Recruitment < ApplicationRecord
  belongs_to :theater
  belongs_to :genre, optional: true

  has_many :applications, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_many :tags, dependent: :destroy

  has_one_attached :image

  enum :status, {
    open: 0,
    closed: 1
  }
end