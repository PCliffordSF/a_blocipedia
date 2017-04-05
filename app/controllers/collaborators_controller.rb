class CollaboratorsController < ApplicationController
  def add
#     $standard_users = User.standard_users
     #collaborator = Collaborator.New
     Rails.logger.info "INSIDE ADD"
     Rails.logger.info "INSIDE ADD"
     Rails.logger.info "INSIDE ADD"
     Rails.logger.info "INSIDE ADD"
     flash[:notice] = "User was added as a collaborator."
     redirect_to root_path
  end
    
    
end
