class AddressesController < ApplicationController

def index 
end

def destroy
  @profile.addresses.delete(@address)
end

private

def set_address 
  profile = Profile.find(params[:id])
  @address = profile.addresses(params[:addresses][:id])
end
