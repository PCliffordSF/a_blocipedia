class WikisController < ApplicationController
    

  def index
     @wikis = policy_scope(Wiki)
     render :index
  end

  def new
    @wiki = Wiki.new
    render :new
  end

   def create
       
     @wiki = Wiki.new
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     @wiki.private = params[:wiki][:private]
     @wiki.user = current_user

     if @wiki.save
       flash[:notice] = "The wiki was saved."
       redirect_to @wiki # wiki_path(@wiki.id)
     else

       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :new
     end
   end

  def show
      @wiki = Wiki.find(params[:id])
      render :show
  end

  def edit
      @wiki = Wiki.find(params[:id])
      authorize @wiki
      render :edit
  end

  def update
     authorize @wiki
     @wiki = Wiki.find(params[:id])
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
 
     if @wiki.save
       flash[:notice] = "Post was updated."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :edit
     end
  end

  def destroy
     @wiki = Wiki.find(params[:id])
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to welcome_index_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
  end
  
  def downgrade
      downgrade_users_wikis
  end
  
 def add_collaborator
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.where("email = :email")
    Rails.logger.info "inside add collaborator"
    Rails.logger.info @wiki.title
    Rails.logger.info params[:email]
    redirect_to root_path
 end
 
 def tester
    Rails.logger.info "inside tester"
    redirect_to root_path
 end
 

  
end
