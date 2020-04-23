class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :current_user

  def check_user
    user_email = request.headers['email'].presence
    @current_user = user_email && User.find_by_email(user_email)
    return render_403 unless @current_user
    return @current_user
  end

  def render_403(errors = 'Forbidden')
    render_errors(errors, 403)
  end

  def render_errors(errors, status = 403)
    data = { notice: errors.to_s }
    render json: data, status: status
  end
end
