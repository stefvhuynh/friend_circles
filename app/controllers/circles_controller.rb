class CirclesController < ApplicationController

  def index
    @circles = current_user.owned_circles
  end

  def show
    @circle = Circle.find(params[:id])
    render :show
  end

  def create
    @circle = current_user.owned_circles.build(circle_params)

    if @circle.save
      redirect_to circle_url(@circle)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def new
    @circle = Circle.new
    render :new
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def circle_params
    params.require(:circle).permit(:name, member_ids: [])
  end

end
