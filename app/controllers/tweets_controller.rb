class TweetsController < ApplicationController

  def show
    @user = current_user
    @tweets = @user.tweets
  end
end
