# frozen_string_literal: true

module AdminPanel
  class HomepageContentsController < BaseController
    before_action :set_homepage_content

    def edit
    end

    def update
      if @homepage_content.update(homepage_content_params)
        redirect_to edit_admin_homepage_content_path, notice: 'Homepage content was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_homepage_content
      @homepage_content = HomepageContent.first_or_create!
    end

    def homepage_content_params
      params.require(:homepage_content).permit(:hero_title, :hero_subtitle, :about_snippet, :hero_image)
    end
  end
end
