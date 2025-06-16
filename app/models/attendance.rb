class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true

  after_create :notify_admin

  private

  def notify_admin
    AttendanceMailer.new_participant(self).deliver_now
  end
  
end
