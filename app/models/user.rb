class User < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :scouts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && is_active?
  end

  def inactive_message
    is_active? ? super : :inactive
  end
end
