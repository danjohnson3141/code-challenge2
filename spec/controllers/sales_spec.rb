require 'spec_helper'
	
describe "SalesController" do

	before :each do
	  @file = fixture_file_upload('app/example_data.csv', 'text/csv')
	end

	it "can sign in via Devise" do
    @user ||= FactoryGirl.create(:user, email: 'test@example.com', password: 'test1234')
    post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password

    response.status.should eq 200
	  
	  # post "/sale_imports/", { "authenticity_token"=> @user.encrypted_password, sale_import: { file: @file } }
	  # binding.pry
	  # response.should be_success
	end

	it "Redirects us when not authenticated." do
      get sales_path

      response.status.should be(302)
  end
end