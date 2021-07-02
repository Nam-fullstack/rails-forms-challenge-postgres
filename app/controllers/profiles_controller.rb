class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]

    def index
        @profiles = Profile.all
    end

    def show
    end

    def new
        @profile = Profile.new
        2.times { @profile.addresses.build }
    end

    def create
        @profile = Profile.create(profile_params)
        redirect_to @profile
        #finish logic for creating a record
    end

    def edit

    end

    def update
        #finsih logic for updating the record
        @profile.update(profile_params)
        redirect_to profiles_path
    end

    def destroy
        #finish logic for deleting the record
        @profile.addresses.destroy
        @profile.destroy
        redirect_to profiles_path
    end

    private

    def set_profile
        id = params[:id]
        @profile = Profile.find(id)
    end

    def profile_params
        params.require(:profile).permit(:name, :age, :bio, addresses_attributes: [:street, :city, :state, :postcode, :profile_id])
        # .merge(profile_id: current_profile.id)
    end
end