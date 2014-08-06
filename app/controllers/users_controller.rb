class UsersController < ApplicationController

  def feed
    belong_to_circles = current_user.belong_to_circles

    @friend_posts = belong_to_circles.each_with_object([]) do |circle, posts|
      circle.shared_posts.each { |post| posts << post }
    end

    @friend_posts.sort! { |post1, post2| post2.updated_at <=> post1.updated_at }

    render :feed
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in!(@user)
      redirect_to feed_user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to feed_user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
