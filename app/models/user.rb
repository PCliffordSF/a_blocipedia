class User < ActiveRecord::Base
  has_many :wikis
  
  before_create :default_to_standard



  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable  , :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
         
  enum role: [:guest, :standard, :premium, :admin]
  

  def default_to_standard
    self.role = :standard
  end
  
  def upgrade_to_premium
     self.role = :premium 
     self.save
     self
  end
  
  def downgrade_to_standard
     self.role = :standard
     self.save
     self
  end
  
def downgrade_users_wikis
    user_id = current_user.id
    @wikis = Wiki.find(:all, 
        :conditions => ['user_id = user_id'])
    @wikis.each do |wiki|
       wiki.private = false
       wiki.save
    end
    redirect_to root_path
      
end

end