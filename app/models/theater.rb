class Theater < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :recruitments, dependent: :destroy
  has_many :scouts, dependent: :destroy
end
