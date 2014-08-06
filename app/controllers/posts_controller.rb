class PostsController < ApplicationController
  
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
    params.require(:post).permit(:title, :body, share_ids: [])
  end
  
  def link_params    
    params.permit(link: :url)
      .require(:link)
      .values
      .reject { |hash| hash.values.all?(&:blank?) }
  end
  
end
