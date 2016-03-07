class WelcomeController < ApplicationController
  def index
  end

  def show
    if params[:feeling] == "good"
      @feeling = "good"
    elsif params[:feeling] == "bad"
      @feeling = "bad"
    end
    # make get request for API call, either good or bad
    # (optional tech would be to create a "wrapper" or gem for my API)
    # if call successful: parse necessary info from API call
    # if not successful, flash error message and render :index
  end
end
