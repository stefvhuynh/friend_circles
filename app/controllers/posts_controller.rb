class PostsController < ApplicationController
  before_filter :require_signed_in!

  def create
    @post = current_user.posts.build(post_params)
    @post.links.build(link_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def new
    @post = Post.new
    render :new
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, shared_circle_ids: [])
  end

  def link_params
    params.permit(links: :url)
      .require(:links)
      .values
      .reject { |hash| hash.values.all?(&:blank?) }
  end

end
