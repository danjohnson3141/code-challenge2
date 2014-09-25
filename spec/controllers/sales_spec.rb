require 'spec_helper'
	
describe "SalesController" do

	before :each do
	  @file = fixture_file_upload('app/example_data.csv', 'text/csv')
	end

	it "can upload a license" do
	  post :sale_imports, :upload => @file
	  response.should be_success
	end
end
