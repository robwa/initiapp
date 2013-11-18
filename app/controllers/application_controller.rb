class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def initiative_params
    params.require(:initiative).permit(:name)
  end

  def text_params
    params.require(:text).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def user
    if user_signed_in?
      current_user
    else
      User.find_or_create_by(email: user_params[:email])
    end
  end
end
