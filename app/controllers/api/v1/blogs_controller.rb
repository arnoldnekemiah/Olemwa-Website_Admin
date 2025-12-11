# frozen_string_literal: true

module Api
  module V1
    class BlogsController < BaseController
      def index
        @blogs = Blog.published.includes(:admin).recent
        
        render json: @blogs.map { |blog| blog_json(blog) }
      end
      
      def show
        # Support both ID and slug lookup
        @blog = if params[:id].match?(/\A\d+\z/)
          Blog.published.includes(:admin).find(params[:id])
        else
          Blog.published.includes(:admin).find_by!(slug: params[:id])
        end
        
        render json: blog_json(@blog)
      end
      
      private
      
      def blog_json(blog)
        {
          id: blog.id,
          title: blog.title,
          slug: blog.slug,
          content: blog.content,
          status: blog.status,
          published_at: blog.published_at,
          cover_image_url: image_url(blog, :cover_image),
          author: {
            id: blog.admin.id,
            name: blog.admin.name,
            email: blog.admin.email
          },
          created_at: blog.created_at,
          updated_at: blog.updated_at
        }
      end
    end
  end
end
