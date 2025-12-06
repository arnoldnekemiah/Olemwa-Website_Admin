# frozen_string_literal: true

module AdminPanel
  class EventsController < BaseController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
      @events = Event.by_date
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

      if @event.save
        redirect_to admin_event_path(@event), notice: 'Event was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @event.update(event_params)
        redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_events_path, notice: 'Event was successfully deleted.'
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :event_date, :location, :registration_url, :status)
    end
  end
end
