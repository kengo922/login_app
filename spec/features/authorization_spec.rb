# spec/features/authorization_spec.rb
require 'rails_helper'

RSpec.feature "Authorization", type: :feature do

  describe "in UsersController", type: :request do
    describe "login is necessary" do
      context "when non-login" do
        describe "index" do
          subject { Proc.new { get users_path } }
          it_behaves_like "error flash", "Please log in"
          it_behaves_like "redirect to path", "/login"
        end
      end
    end
  end
end