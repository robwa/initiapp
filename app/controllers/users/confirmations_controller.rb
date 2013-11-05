class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /
  def show
    self.resource = resource_class.find_by(confirmation_token: params[:confirmation_token]) if params[:confirmation_token].present?
    super if resource.nil? or resource.confirmed?
  end

  # PATCH /
  def confirm
    confirmation_token = params.require(resource_name)[:confirmation_token]
    self.resource = resource_class.find_by(confirmation_token: confirmation_token)
    unless resource.nil?
      if resource.update(resource_params)
        resource.confirm!
        set_flash_message(:notice, :confirmed)
        redirect_to after_confirmation_path_for(resource_name, resource)
      else
        render :show
      end
    else
      redirect_to action: :show, confirmation_token: confirmation_token
    end
  end


  private

  def resource_params
    params.require(:user).except(:confirmation_token).permit(:password, :password_confirmation)
  end  
end
