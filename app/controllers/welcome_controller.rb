class WelcomeController < ApplicationController
  def index
  end

  def show
    @hashtag = HTTParty.get("http://hashtagfeels-92395643.us-east-1.elb.amazonaws.com/#{params[:feeling]}")
    @tweets = $twitter.search(@hashtag["name"]).take(8)

    if response.code == 500
      flash[:error] = "Button currently not working."
      render :index
    else
      render :show
    end
  end
end
