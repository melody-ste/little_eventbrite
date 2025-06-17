class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :administered_events, class_name: "Event", foreign_key: "admin_id"
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
