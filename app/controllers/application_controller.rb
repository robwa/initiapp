class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def initiative_params
    params.require(:initiative).permit(:name)
  end

  def topic_params
    params.require(:topic).permit(:name)
  end

  def text_params
    params.require(:text).permit(:body)
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def find_or_create_actable_user
    if user_signed_in?
      current_user
    else 
      begin
        user = User.find_by(email: user_params[:email])
        unless user
          user = User.new(email: user_params[:email])
          user.skip_confirmation_notification!
          user.save
        end
        user if user.passive?
      rescue ActiveRecord::RecordNotUnique
        retry
      end
    end
  end


  private

  def current_ability
    @current_ability ||= Ability.new(current_user, params[:initiative_id])
  end
end
