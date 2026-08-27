class Genre < ApplicationRecord
  has_many :recruitments

  validates :name, presence: true
end