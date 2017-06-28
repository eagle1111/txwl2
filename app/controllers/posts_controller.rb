class PostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @group = Group.find_by(params[:group_id])
    @post = Post.find_by(params[:id])

  end
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end
  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
end
private
def post_params
  params.require(:post).permit(:title, :content)
end
