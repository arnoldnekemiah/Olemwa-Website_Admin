# frozen_string_literal: true

module Api
  module V1
    class EventsController < BaseController
      def index
        # Return upcoming and ongoing events
        @events = Event.where(status: [:upcoming, :ongoing]).by_date
        
        render json: @events.map { |event| event_json(event) }
      end
      
      def show
        @event = Event.find(params[:id])
        
        render json: event_json(@event)
      end
      
      private
      
      def event_json(event)
        {
          id: event.id,
          title: event.title,
          description: event.description,
          event_date: event.event_date,
          location: event.location,
          registration_url: event.registration_url,
          status: event.status,
          created_at: event.created_at,
          updated_at: event.updated_at
        }
      end
    end
  end
end
