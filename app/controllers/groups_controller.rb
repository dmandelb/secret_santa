class GroupsController < ApplicationController
  def index
    @groups = Group.order(created_at: :desc).limit(10)
  end

  def show
    @group = Group.includes(:users).includes(:admin).find_by(id: params[:id])
  end
end
