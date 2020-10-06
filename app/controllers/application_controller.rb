# Controlador de la aplicacion
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :username, :name, :date_of_birth, :description,
        :phone_number, :gender, :email, :password, :comuna_id,
        :password_confirmation, :foto_perfil, :deporte, :musica,
        :comida, :genero_pelicula
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :name, :date_of_birth, :gender, :description,
        :phone_number, :email, :password, :current_password,
        :comuna_id, :role, :password_confirmation, :foto_perfil,
        :deporte, :musica, :comida, :genero_pelicula
      )
    end
  end
end
