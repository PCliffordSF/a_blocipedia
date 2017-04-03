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
    
    
    
end
