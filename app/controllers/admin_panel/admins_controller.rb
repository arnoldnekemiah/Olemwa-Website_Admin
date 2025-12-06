module AdminPanel
  class AdminsController < BaseController
    before_action :require_admin_role
    before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

    def index
      @admins = Admin.order(created_at: :desc)
    end

    def show
    end

    def new
      @admin_user = Admin.new
    end

    def create
      @admin_user = Admin.new(admin_params)
      
      if @admin_user.save
        redirect_to admin_panel_admins_path, notice: 'Admin user was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      # Don't allow changing own role
      if @admin_user == current_admin && admin_params[:role].present?
        redirect_to admin_panel_admins_path, alert: 'You cannot change your own role.'
        return
      end

      if @admin_user.update(admin_params)
        redirect_to admin_panel_admins_path, notice: 'Admin user was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      # Don't allow deleting yourself
      if @admin_user == current_admin
        redirect_to admin_panel_admins_path, alert: 'You cannot delete yourself.'
        return
      end

      @admin_user.destroy
      redirect_to admin_panel_admins_path, notice: 'Admin user was successfully deleted.'
    end

    private

    def set_admin_user
      @admin_user = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation, :role)
    end

    def require_admin_role
      unless current_admin.admin?
        redirect_to admin_panel_dashboard_path, alert: 'You do not have permission to access this page.'
      end
    end
  end
end
