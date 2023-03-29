class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  #after_action : avant de rendre la view
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
  #this method checks if it can skip its authorization checks
    #if
    #the current controller inherit from devise::sessionsController => true
    # if
    # the current controller's name matches one of the following regular expressions:
        #^(rails_)?admin == names start with admin or rails_admin
        # (^pages$) == matches controller with the name of pages
    ## return true
  # if neither of this conditions are met (returns false)
  # Pundit should perform its authorization checks
end
