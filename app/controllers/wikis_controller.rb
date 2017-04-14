class WikisController < ApplicationController
    

  def index
     @wikis = Wiki.all
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
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     @wiki.private = params[:wiki][:private]
 
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
    @wiki = Wiki.find(params[:id])
    @user = User.find_by email: params["email"]
    #@user = User.where('email = ?', params["email"]).first
    #@user = User.where(email: params['email']).first
    if @user
        Rails.logger.info "you have selected user"
        Rails.logger.info @user.email
        Rails.logger.info "You have selected wiki"
        Rails.logger.info @wiki.title
        @wiki.collaboratingusers << @user
        @wiki.save
   else
        flash[:alert] = "\"#{params["email"]}\" isn't a valid email address... dummy"
    end

    redirect_to root_path
 end
 
#  def tester
#     Rails.logger.info "inside tester"
#     Rails.logger.info params["email"] 
#     Rails.logger.info params["wiki_id"]
#     redirect_to root_path
#  end
 

  
end
