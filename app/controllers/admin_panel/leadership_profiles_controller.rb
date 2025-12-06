# frozen_string_literal: true

module AdminPanel
  class LeadershipProfilesController < BaseController
    before_action :set_leadership_profile, only: [:show, :edit, :update, :destroy]

    def index
      @leadership_profiles = LeadershipProfile.by_position
    end

    def show
    end

    def new
      @leadership_profile = LeadershipProfile.new
    end

    def edit
    end

    def create
      @leadership_profile = LeadershipProfile.new(leadership_profile_params)

      if @leadership_profile.save
        redirect_to admin_leadership_profile_path(@leadership_profile), notice: 'Leadership profile was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @leadership_profile.update(leadership_profile_params)
        redirect_to admin_leadership_profile_path(@leadership_profile), notice: 'Leadership profile was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @leadership_profile.destroy
      redirect_to admin_leadership_profiles_path, notice: 'Leadership profile was successfully deleted.'
    end

    private

    def set_leadership_profile
      @leadership_profile = LeadershipProfile.find(params[:id])
    end

    def leadership_profile_params
      params.require(:leadership_profile).permit(:name, :role, :bio, :position_order, :photo)
    end
  end
end
