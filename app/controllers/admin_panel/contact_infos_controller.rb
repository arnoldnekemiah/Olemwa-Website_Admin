# frozen_string_literal: true

module AdminPanel
  class ContactInfosController < BaseController
    before_action :set_contact_info

    def edit
    end

    def update
      if @contact_info.update(contact_info_params)
        redirect_to edit_admin_contact_info_path, notice: 'Contact info was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_contact_info
      @contact_info = ContactInfo.first_or_create!
    end

    def contact_info_params
      params.require(:contact_info).permit(:phone, :email, :location, :facebook_url, :twitter_url, :instagram_url)
    end
  end
end
