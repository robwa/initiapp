class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /
  def show
    confirmation_token = Devise.token_generator.digest(resource_class, :confirmation_token, params[:confirmation_token])
    self.resource = resource_class.find_by(confirmation_token: confirmation_token)
    super if resource.nil? or resource.confirmed?
  end

  # PATCH /
  def confirm
    confirmation_token = params[:confirmation_token]
    self.resource = resource_class.find_by(confirmation_token: confirmation_token)
    unless resource.nil?
      if resource.update(resource_params.permit(:password, :password_confirmation))
        resource.confirm!
        sign_in(resource)
        set_flash_message(:notice, :confirmed)
        redirect_to after_confirmation_path_for(resource_name, resource)
      else
        set_flash_message(:alert, :unconfirmed)
        render :show
      end
    else
      set_flash_message(:alert, :unconfirmed)
      redirect_to action: :show, confirmation_token: confirmation_token
    end
  end
end
