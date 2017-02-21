class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def has_voted(q)
    if current_user
      q.answers.each do |a|
        a.get_upvotes.each do |v|
          if current_user.id == v.voter_id
            return true
          end
        end
      end
    end
    return false
  end
  helper_method :has_voted

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
