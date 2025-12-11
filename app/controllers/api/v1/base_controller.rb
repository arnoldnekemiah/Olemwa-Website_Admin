# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      # Skip CSRF verification for API requests
      skip_before_action :verify_authenticity_token
      
      # Ensure all responses are JSON
      respond_to :json
      
      # Standard error handling
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActionController::ParameterMissing, with: :bad_request
      
      private
      
      def not_found
        render json: { error: 'Not Found', message: 'The requested resource could not be found' }, status: :not_found
      end
      
      def bad_request
        render json: { error: 'Bad Request', message: 'Required parameters are missing' }, status: :bad_request
      end
      
      # Helper method to generate image URLs for Active Storage attachments
      def image_url(record, attachment_name)
        attachment = record.send(attachment_name)
        return nil unless attachment.attached?
        
        Rails.application.routes.url_helpers.rails_blob_url(attachment, only_path: false)
      end
    end
  end
end
