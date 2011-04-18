#controller to set the session for enabling the lightbox
class LightboxSessionsController < ApplicationController
  def create
    session[:enable_lightbox] = params[:enable_lightbox] == "1" ? true : nil
    render :nothing => true
  end
end
