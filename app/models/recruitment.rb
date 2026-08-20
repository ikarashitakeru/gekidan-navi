class Recruitment < ApplicationRecord
  belongs_to :theater

  enum :status, {
    open: 0,
    closed: 1
  }
end