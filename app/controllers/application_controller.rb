class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :profession, :country, :timezone])
  end

  private

  # Its important that the location is NOT stored if:
  # - The request method is not GET (non-idempotent)
  # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an infinite redirect loop.
  # - The request is an Ajax request as this can lead to very unexpected behavior.
  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  # Overwrite the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_path, alert: 'You need to sign in or sign up before continuing.' }
        format.json { render json: { error: 'You need to sign in or sign up before continuing.' }, status: :unauthorized }
        format.js   {
          render js: "Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'You need to sign in or sign up before continuing.',
            confirmButtonText: 'OK'
          }).then(() => { window.location = '#{new_user_session_path}'; });"
        }
      end
    end
  end
end
