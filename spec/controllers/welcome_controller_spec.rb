require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  # let(:user) { build(:user1) }

  describe "GET #index" do
    it "renders index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #show", :vcr do
    context "when not logged in" do
      it "redirects to root" do
        post :show
        expect(response).to redirect_to root_path
      end
    end

    context "when logged in" do
      context "when feeling = good" do
        it "renders show page" do
          u = User.create({name: "Ricky", uid: "1234"})
          session[:user_id] = u.id
          post :show, :feeling => "positive"
          expect(response).to render_template :show
        end
      end
      context "when feeling = bad" do
        it "renders show page" do
          u = User.create({name: "Ricky", uid: "1234"})
          session[:user_id] = u.id
          post :show, :feeling => "negative"
          expect(response).to render_template :show
        end
      end
    end

  end
end
