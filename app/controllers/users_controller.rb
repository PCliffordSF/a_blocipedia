class UsersController < ApplicationController
    
def upgrade
     current_user.upgrade_to_premium
     current_user.reload
     redirect_to root_path
     flash[:notice] = "You were upgraded successfully."
 end
end
