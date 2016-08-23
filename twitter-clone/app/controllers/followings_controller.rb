class FollowingsController < ApplicationController
  def new
    @following = Following.new
  end

  def create
    @following = Following.new
    @following.follower_id = params[:follower_id]
    @following.followed_id = params[:followed_id]
    @following.save
    redirect_to(:tweets)
  end
end
