class CollaboratorsController < ApplicationController
  
  def new
    @collaborator = Collaborator.new
  end
  
  def add
     Rails.logger.info "INSIDE ADD"
     
     $collaborator = Collaborator.new
     
     $collaborator.user_id = params[:user_id]
     $collaborator.wiki_id = params[:wiki_id]
     Rails.logger.info $collaborator.save
     flash[:notice] = "User was added as a collaborator."
     redirect_to root_path
  end
    
    
end
