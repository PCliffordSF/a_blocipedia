module WikisHelper
    
  def downgrade_users_wikis
    @wikis = Wiki.all
    @wikis.each do |wiki|
       Rails.logger.info wiki.self.inspect
       wiki.private = false
       Rails.logger.info wiki.self.inspect
       wiki.save
    end
    redirect_to welcome_index_path
  end
  
  def index_view(wiki)
     wiki.private != true || current_user.role == 'premium' 
  end
  
  def show_collaborator wiki
      @collaborators = get_collaborators wiki
      @collaborators.length != 0 && current_user.premium?
  end
  
  def get_collaborators wiki
      Collaborator.where('wiki_id = ?', wiki.id)
  end
    
    
end
