class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
         #:registerable, :recoverable

  has_many :validations,  dependent: :destroy


  def self.notificable
    where(notification: true)
  end
end
