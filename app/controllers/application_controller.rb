class ApplicationController < ActionController::Base

  def authenticate!
    redirect_to new_customer_registration_path unless customer_signed_in?
  end
end
