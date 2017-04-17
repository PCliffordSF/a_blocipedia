class CollaboratorsController < ApplicationController
  
  def new
    @collaborator = Collaborator.new
  end
  
  def destroy
    @collaborator = Wiki.find(params[:id])
     if @collaborator.destroy
       flash[:notice] = "collaborator was deleted successfully."
       redirect_to wiki_path
     else
       flash.now[:alert] = "There was an error deleting the collaborator."
       redirect_to wiki_path
     end
    
  end
    
    
end
