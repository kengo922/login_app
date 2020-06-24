require 'rails_helper'

RSpec.describe "HomesApi", type: :request do
  describe "各ページに行くか確認する" do
    it "Homeページのhttpリクエストは正しいか" do
      get root_path
      expect(response).to have_http_status(200)
    end
    it "Aboutページのhttpリクエストは正しいか" do
      get static_pages_about_path
      expect(response).to have_http_status(200)
    end

    it "Helpページのhttpリクエストは正しいか" do
      get static_pages_help_path
      expect(response).to have_http_status(200)
    end
    
  end

end