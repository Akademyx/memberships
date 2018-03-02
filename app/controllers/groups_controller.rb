class GroupsController < ApplicationController
    def create

        @group = Group.new(group_params)
        if @group.valid?
            Membership.create(user:current_user, group:@group)
            redirect_to :back
        else
            flash[:error] = @group.errors.full_messages
            redirect_to "/groups"
        end
    end
    
    # def create
    #     @group = Group.create(group_params)
    #     Membership.create(user:current_user, group:@group)
    #     redirect_to "/groups"
    # end
    
    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to "/groups"
    end
    
    def show
        @g = Group.find(params[:id])
        @b = Membership.find_by_group_id_and_user_id(@g.id, current_user.id)
        # @group = Membership.joins(:user).where("memberships.group_id = ?", @g.id)
        @group = Membership.joins(:group).where("memberships.group_id = ?", @g.id)
        
        @members = Membership.joins(:user).where("memberships.group_id = ?", @g.id)
    end
    
    private
    def group_params
        params.require(:group).permit(:user_id, :name, :description)
    end
end
