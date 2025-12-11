# frozen_string_literal: true

module Api
  module V1
    class LeadershipProfilesController < BaseController
      def index
        @profiles = LeadershipProfile.by_position
        
        render json: @profiles.map { |profile| profile_json(profile) }
      end
      
      private
      
      def profile_json(profile)
        {
          id: profile.id,
          name: profile.name,
          role: profile.role,
          bio: profile.bio,
          position_order: profile.position_order,
          photo_url: image_url(profile, :photo),
          created_at: profile.created_at,
          updated_at: profile.updated_at
        }
      end
    end
  end
end
