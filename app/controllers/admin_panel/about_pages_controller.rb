# frozen_string_literal: true

module AdminPanel
  class AboutPagesController < BaseController
    before_action :set_about_page

    def edit
    end

    def update
      if @about_page.update(about_page_params)
        redirect_to edit_admin_about_page_path, notice: 'About page was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_about_page
      @about_page = AboutPage.first_or_create!
    end

    def about_page_params
      params.require(:about_page).permit(:mission, :vision, :main_content, :history)
    end
  end
end
