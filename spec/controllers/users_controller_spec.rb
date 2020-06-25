require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "エラーメッセージの確認" do
    it "空白でないこと" do
        user = User.new()
        user.valid?
        expect(user.errors.messages[:name]).to include("を入力してください")
    end

  end
end
