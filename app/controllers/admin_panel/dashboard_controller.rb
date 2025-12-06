# frozen_string_literal: true

module AdminPanel
  class DashboardController < BaseController
    def index
      @admins_count = ::Admin.count
      @projects_count = Project.count
      @blogs_count = Blog.count
      @events_count = Event.count
      @recent_blogs = Blog.order(created_at: :desc).limit(5)
      @upcoming_events = Event.upcoming.by_date.limit(5)
    end
  end
end
