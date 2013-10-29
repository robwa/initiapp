def user_stubs(options = {})
  allow(helper).to receive(:user_signed_in?).and_return(options[:sign_in])
  if options[:sign_in]
    user = double(User)
    allow(helper).to receive(:current_user).and_return(user)
    allow(user).to receive(:member_of?).and_return(options[:member])
  end
end

def initiative_stubs
  Initiative.stub_chain(:friendly, :find)
end
