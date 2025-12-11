# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < BaseController
      def index
        @projects = Project.published.order(created_at: :desc)
        
        render json: @projects.map { |project| project_json(project) }
      end
      
      def show
        @project = Project.published.find(params[:id])
        
        render json: project_json(@project)
      end
      
      private
      
      def project_json(project)
        {
          id: project.id,
          title: project.title,
          description: project.description,
          status: project.status,
          published: project.published,
          cover_image_url: image_url(project, :cover_image),
          created_at: project.created_at,
          updated_at: project.updated_at
        }
      end
    end
  end
end
