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
 
 def standard_user
    Rails.logger.info "standard_user method"  
    Rails.logger.info "standard_user method"  
    Rails.logger.info "standard_user method" 
    render :standard
    
 end
end
