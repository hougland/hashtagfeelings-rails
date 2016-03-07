class WelcomeController < ApplicationController
  def index
  end

  def show
    @hashtag = HTTParty.get("https://hashtagfeelings.herokuapp.com/#{params[:feeling]}")
    if response.code == 500
      flash[:error] = "Button currently not working."
      render :index
    else
      render :show
    end
  end
end
