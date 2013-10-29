def user_stubs(options = {})
  allow(controller).to receive(:user_signed_in?).and_return(options[:sign_in])
  if options[:sign_in]
    user = double(User, email: options[:email])
    allow(controller).to receive(:current_user).and_return(user)
    allow(user).to receive(:member_of?).and_return(options[:member])
  end
end

def initiative_stubs(options = {})
  Initiative.stub(:new).and_return(options[:initiative])
  Initiative.stub_chain(:friendly, :find).and_return(options[:initiative])
end
