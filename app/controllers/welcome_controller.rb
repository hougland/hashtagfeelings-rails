require 'uri'

class WelcomeController < ApplicationController
  before_action :current_user
  before_action :require_login, only: :show

  def index
    @display_popup = display_popup?
    puts "TESTING IF THIS LOGS"
  end

  def about; end

  def show
    if params[:feeling] == "positive"
      @feeling = "good"
    elsif params[:feeling] == "negative"
      @feeling = "bad"
    end

    @hashtag = HTTParty.get("https://hashtagfeels-api.herokuapp.com/#{params[:feeling]}")
    @tweets = $twitter.search(@hashtag["name"]).take(8)
    @search_url = get_search_url(@hashtag["name"])

    if response.code == 500
      flash[:error] = "Button currently not working."
      render :index
    else
      render :show
    end
  end

  def get_search_url(hashtag)
    return URI.escape("https://twitter.com/search?q=#{hashtag}")
  end

  def display_popup?
    if @current_user.nil?
      return true
    end
  end
end
