require 'rails_helper'

RSpec.describe "UsersApi", type: :request do

  let(:params){
     {name: "testuser1", email: "test@example.com", password: "test123", password_confirmation: "test123"}
  }

  before do
    get signup_path
  end


  describe "users#<create>" do
    it "postデータの受け取りができること" do
      post users_path, params: {user: params}

      expect(response).to have_http_status(302)
    end
  end
end