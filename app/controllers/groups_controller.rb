class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def show
    @group = Group.find(params[:id])
    @posts = @group.posts.recent.paginate(:page => params[:page], :per_page => 5)
  end
end
def group_params
  params.require(:group).permit(:title, :description)
end
