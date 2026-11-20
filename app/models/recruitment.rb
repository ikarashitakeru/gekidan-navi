class Recruitment < ApplicationRecord
  belongs_to :theater
  belongs_to :genre

  has_many :applications, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_many :tags, dependent: :destroy

  has_one_attached :image

  enum :status, {
    open: 0,
    closed: 1
  }

  validates :title, presence: true
  validates :description, presence: true

  validates :capacity,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }

  validates :deadline, presence: true
  validates :activity_area, presence: true
  validates :status, presence: true
end
