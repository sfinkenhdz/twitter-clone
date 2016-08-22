class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    @hashtags = Hashtag.all
  end

end

