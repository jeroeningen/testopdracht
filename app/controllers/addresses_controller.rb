class AddressesController < ApplicationController
  def create
    @address = Address.address(params[:zipcode])
  end
end
