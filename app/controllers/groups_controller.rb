class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(created_at: :desc)
  end
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "创建成功"
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
