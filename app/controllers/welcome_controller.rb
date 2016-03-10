class WelcomeController < ApplicationController
  def index
  end

  def show
    @hashtag = HTTParty.get("https://hashtagfeelings.herokuapp.com/#{params[:feeling]}")
    @tweets = $twitter.search("to:justinbieber marry me", result_type: "recent").take(3)

    if response.code == 500
      flash[:error] = "Button currently not working."
      render :index
    else
      render :show
    end
  end
end
