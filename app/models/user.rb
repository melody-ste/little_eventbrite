class User < ApplicationRecord

  has_many :administered_events, class_name: "Event", foreign_key: "admin_id"
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  validates :email, presence: true, uniqueness:true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
