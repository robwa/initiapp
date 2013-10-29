module InitiativesHelper
  def user_is_member?
    if user_signed_in?
      initiative = Initiative.friendly.find(params[:id])
      current_user.member_of?(initiative)
    end
  end
end
