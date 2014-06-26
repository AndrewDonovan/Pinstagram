describe HomeController do
	describe "GET index" do
    		it "has a 302 status code" do
      			get :index
      			expect(response.status).to eq(302)
  		end
  	end
end