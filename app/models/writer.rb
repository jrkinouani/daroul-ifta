class Writer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
         #:registerable, :recoverable

  has_many :answers

  def self.notificable
    where(notification: true)
  end
end
