class AddressesController < ApplicationController
  #return the address of the given zipcode
  def show
    render :update do |page|
      page << "$('div#zipResult').html('#{Address.address(params[:zipcode])}')"
    end
  end
end
