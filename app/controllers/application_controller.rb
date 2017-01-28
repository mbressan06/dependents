class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?


  def allow_html_only
    if params[:format] != "html"
      render file: "#{Rails.root}/public/404.html"
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :document])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :document])
    end
end
