class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    @hashtags = Hashtag.order('count').reverse_order.limit(5)
    if current_user
      @users = User.all - current_user.followeds
    end
    @following = Following.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.creator_id = current_user.id
    @tweet.increment_hashtag
    @tweet.retweet_count = 0
    @tweet.like_count = 0

    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  private

  def tweet_params
      params.require(:tweet).permit(:content, :image)
  end

end

