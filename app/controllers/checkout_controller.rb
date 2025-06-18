class CheckoutController < ApplicationController
  def create
    event = Event.find(params[:event_id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: "Participation à l'événement : #{event.title}",
          },
          unit_amount: event.price * 100,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: checkout_success_url(event_id: event.id, user_id: current_user.id),
      cancel_url: event_url(event),
    )

    redirect_to session.url, allow_other_host: true
  end

 def success
    @event = Event.find(params[:event_id])
    unless @event.participants.include?(current_user)
      Attendance.create!(
        user: current_user,
        event: @event,
        stripe_customer_id: params[:session_id] || "test_id" # adapte cette valeur !
      )
    end
    redirect_to event_path(@event), notice: "Tu es inscrit à l'événement"
  end
end
