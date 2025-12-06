# frozen_string_literal: true

module AdminPanel
  class BlogsController < BaseController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]

    def index
      @blogs = Blog.includes(:admin).order(created_at: :desc)
    end

    def show
    end

    def new
      @blog = current_admin.blogs.build
    end

    def edit
    end

    def create
      @blog = current_admin.blogs.build(blog_params)

      if @blog.save
        redirect_to admin_blog_path(@blog), notice: 'Blog post was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @blog.update(blog_params)
        redirect_to admin_blog_path(@blog), notice: 'Blog post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @blog.destroy
      redirect_to admin_blogs_path, notice: 'Blog post was successfully deleted.'
    end

    private

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :status, :published_at, :cover_image)
    end
  end
end
