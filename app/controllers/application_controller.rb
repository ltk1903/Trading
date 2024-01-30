class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :alias, :phone, :email])
  end

  def set_locale
    language = params[:lang] || headers['APP-Locale'] || request.headers['APP-Locale']
    if I18n.available_locales.include? language.to_s.to_sym
      I18n.locale = language
    else
      I18n.locale = :vi
    end
  end


  def set_locale
    # user specific languages
    if params[:locale] then
      # set cookies
      cookies[:locale] = params[:locale]
    end
    # set languages 
    I18n.locale = I18n.default_locale
    # get cookies for languages
    if cookies[:locale] then
      if I18n.available_locales.include?(cookies[:locale].to_sym) then
        I18n.locale = cookies[:locale]
      end
    end
  end
  
  def change_locale
    # set languages
    I18n.locale = params[:locale].to_s.strip.to_sym

    I18n.locale = I18n.default_locale unless I18n.available_locales.include?(I18n.locale)
    # set cookies for languages
    cookies[:locale] = I18n.locale.to_s
    # redirect routes
    redirect_to request.referer || root_url
  end

end
