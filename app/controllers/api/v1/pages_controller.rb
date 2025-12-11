# frozen_string_literal: true

module Api
  module V1
    class PagesController < BaseController
      def about
        @about_page = AboutPage.first_or_create!
        
        render json: {
          id: @about_page.id,
          mission: @about_page.mission,
          vision: @about_page.vision,
          main_content: @about_page.main_content,
          history: @about_page.history,
          created_at: @about_page.created_at,
          updated_at: @about_page.updated_at
        }
      end
      
      def contact
        @contact_info = ContactInfo.first_or_create!
        
        render json: {
          id: @contact_info.id,
          phone: @contact_info.phone,
          email: @contact_info.email,
          location: @contact_info.location,
          facebook_url: @contact_info.facebook_url,
          twitter_url: @contact_info.twitter_url,
          instagram_url: @contact_info.instagram_url,
          created_at: @contact_info.created_at,
          updated_at: @contact_info.updated_at
        }
      end
      
      def homepage
        @homepage_content = HomepageContent.first_or_create!
        
        render json: {
          id: @homepage_content.id,
          hero_title: @homepage_content.hero_title,
          hero_subtitle: @homepage_content.hero_subtitle,
          about_snippet: @homepage_content.about_snippet,
          created_at: @homepage_content.created_at,
          updated_at: @homepage_content.updated_at
        }
      end
    end
  end
end
