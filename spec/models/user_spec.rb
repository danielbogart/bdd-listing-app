require 'spec_helper'

describe User do
  it "is valid with name, email and password confirmation" do
    u = create(:user, :agent)
    expect(u).to be_valid
  end
  
  it "sends a confirmation email after sign up" do
    u = create(:user, :agent)
    open_last_email.should be_delivered_to u.email
  end
  
  it "is invalid without email" do
    u = build(:user, :agent, :email=> nil)
    expect(u).to have(1).errors_on(:email)
  end
  
  it "is invalid without name" do
    u = build(:user, :agent, :name=> nil)
    expect(u).to have(1).errors_on(:name)
  end
  
  it "is invalid if passwords don't match" do
    u = build(:user, :agent, :password => "pw1", :password_confirmation => "wp1")
    expect(u).to have(1).errors_on(:password_confirmation)
  end
  
  it "is invalid if no activation code is generated" do
    u = create(:user, :agent)
    expect(u.activation_code).to_not be_nil 
  end
  
end