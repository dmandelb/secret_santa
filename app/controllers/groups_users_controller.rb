class GroupsUsersController < ApplicationController
  def create
    ensure_login
    @group = Group.find_by(id: params[:group_id])
    if params[:secret_key] == @group.secret_key
      groups_user = GroupsUser.create(group: @group, user: current_user)
    end
    redirect_to @group
  end

  private
  def groups_users_params
    params.permit(:secret_key, :group_id)
  end
end