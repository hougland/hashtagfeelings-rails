require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #create" do
    context "user wasn't logged in" do
      before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }
      it "increases user count by 1" do
        expect { get :create, provider: :twitter }.to change(User, :count).by(1)
      end
      it "redirects to home page" do
        get :create, provider: :twitter
        expect(response).to redirect_to root_path
      end
    end

    context "user tries to log in with same provider" do
      before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }
      it "redirects to home page" do
        get :create, provider: :twitter
        get :create, provider: :twitter
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to home page" do
      delete :destroy
      expect(subject).to redirect_to root_path
    end
  end
end
