class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin!, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user

    if @event.save
      redirect_to @event, notice: "Événement créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Événement mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  def destroy
    @event.destroy!
    redirect_to events_path, status: :see_other, notice: "Événement supprimé avec succès."
  end

  private
    
    def set_event
      @event = Event.find(params[:id])
    end

    
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end

    def authorize_admin!
      unless @event.admin == current_user
        redirect_to events_path, alert: "Vous n’êtes pas autorisé à modifier ou supprimer cet événement."
      end
    end
end
