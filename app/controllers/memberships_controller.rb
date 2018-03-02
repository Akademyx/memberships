class MembershipsController < ApplicationController

    def create
        @group = Group.find(params[:g_id])
        Membership.create(user: current_user, group:@group)
        redirect_to "/groups/#{@group.id}"
    end

    def destroy
        @group = Group.find(params[:g_id])
        @member = Membership.find_by_group_id_and_user_id(params[:g_id], current_user.id)
        @member.delete
        redirect_to "/groups/#{@group.id}" 
    end
end
