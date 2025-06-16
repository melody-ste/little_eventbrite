class AttendanceMailer < ApplicationMailer
  def new_participant(attendance)
    @event = attendance.event
    @admin = @event.admin
    @participant = attendance.user

    mail(to: @admin.email, subject: "Nouvelle participation à votre événement")
  end
end
