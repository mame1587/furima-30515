class ApplicationRecord < ActiveRecord::Base
  #before_action :configure_permitted_parameters, if: :devaise_controller?

  # private
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
  self.abstract_class = true
end
