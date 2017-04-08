class UsersController < ApplicationController
    
def upgrade
     current_user.upgrade_to_premium
     redirect_to root_path
     flash[:notice] = "You were upgraded successfully."
 end
 
 def downgrade
     current_user.downgrade_to_standard
     redirect_to root_path
 end
 
 def add_collaborator
    @user = User.new
    @wiki = Wiki.find(params[:wiki_id])
    Rails.logger.info "Inside add_collaborator"
    render :add_collaborator
 end
 

end
