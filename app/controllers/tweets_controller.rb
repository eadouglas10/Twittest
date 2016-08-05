class TweetsController < ApplicationController

  def show
    @user = User.find(current_user)
    @tweets = @user.tweets.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to user_home_path(@tweet.user.id)
    else
      render :show
    end
  end

  def destroy
    @tweet = Tweet.find(params["id"])
    @tweet.destroy
    redirect_to user_home_path(@tweet.user_id)
  end

  def search
    @user = User.where("name LIKE ?", "%#{params[:q]}%")
  end

  private def tweet_params
    params.require(:tweet).permit(:body, :user_id)
  end

end
