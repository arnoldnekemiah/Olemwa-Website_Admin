# frozen_string_literal: true

module AdminPanel
  class ProjectsController < BaseController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      @projects = Project.order(created_at: :desc)
    end

    def show
    end

    def new
      @project = Project.new
    end

    def edit
    end

    def create
      @project = Project.new(project_params)

      if @project.save
        redirect_to admin_project_path(@project), notice: 'Project was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @project.update(project_params)
        redirect_to admin_project_path(@project), notice: 'Project was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @project.destroy
      redirect_to admin_projects_path, notice: 'Project was successfully deleted.'
    end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :status, :published, :cover_image)
    end
  end
end
