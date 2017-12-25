require 'rails_helper'

RSpec.describe RakeController, type: :controller do

  describe "GET #db:migrate" do
    it "returns http success" do
      get :db:migrate
      expect(response).to have_http_status(:success)
    end
  end

end
