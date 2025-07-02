class ApplicationController < ActionController::Base
  include Pundit::Authorization

  after_action :verify_policy_scoped, unless: :skip_pundit?, if: -> { action_name == "index" }
  after_action :verify_authorized, unless: :skip_pundit?, if: -> { action_name != "index" }

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Tu n'es pas autorisé à faire ça."
    redirect_to(request.referrer || root_path)
  end

  def skip_pundit?
    devise_controller? || controller_name.in?(%w[pages])
  end
end
