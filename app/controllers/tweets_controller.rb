class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = current_user.tweets
    # authorize @tweets
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    if(@tweet.user.id != current_user.id)
      redirect_to tweets_path
    end
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    # authorize @tweet
  end

  # GET /tweets/1/edit
  def edit
    if(@tweet.user.id != current_user.id)
      redirect_to tweets_path
    end
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    authorize @tweet
    @tweet.user = current_user

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    if(@tweet.user.id != current_user.id)
      redirect_to tweets_path
    end

    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end

    authorize @tweet
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    if(@tweet.user.id != current_user.id)
      redirect_to tweets_path
    end

    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
      # authorize @tweet
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:text, :user_id)
    end
end