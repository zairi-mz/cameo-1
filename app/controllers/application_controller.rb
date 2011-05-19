# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
  before_filter :set_locale
  before_filter :put_current_user_into_model
  before_filter { |c| Authorization.current_user = User.current_user}
  

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  protected
  
    def permission_denied
      flash[:error] = "Sorry, you are not allowed to access that page"
      redirect_to root_url
    end
  
    def set_locale
      session[:locale] = params[:locale] if params[:locale]
      I18n.locale = session[:locale] || I18n.default_locale

      locale_path = "#{LOCALES_DIRECTORY}#{I18n.locale}.yml"

      unless I18n.load_path.include? locale_path
        I18n.load_path << locale_path
        I18n.backend.send(:init_translations)
      end

    rescue Exception => err
      logger.error err
      flash.now[:notice] = "#{I18n.locale} translation not available"

      I18n.load_path -= [locale_path]
      I18n.locale = session[:locale] = I18n.default_locale
    end
  
    def put_current_user_into_model
      @user = User.find_by_id(session[:user_id])
      if @user
        User.current_user = @user
      end
    end


end