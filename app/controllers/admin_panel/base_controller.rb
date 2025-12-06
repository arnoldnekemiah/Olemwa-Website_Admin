# frozen_string_literal: true

module AdminPanel
  class BaseController < ApplicationController
    before_action :authenticate_admin!
    layout 'admin_panel'
    
    private
    
    def authorize_admin_role!
      unless current_admin.admin?
        flash[:alert] = "You don't have permission to access this page."
        redirect_to admin_panel_dashboard_path
      end
    end
  end
end
