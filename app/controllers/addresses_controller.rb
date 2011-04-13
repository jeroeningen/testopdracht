class AddressesController < ApplicationController
  #return the address of the given zipcode
  def show
    render :update do |page|
      page << "$('div#zipResult').html('#{Address.find_area_by_zipcode(params[:zipcode])}')"
    end
  end
end
