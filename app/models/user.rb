class User < ActiveRecord::Base
  
  has_many :wikis
  has_many :collaborators, through: :wikis
  
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
     Rails.logger.info "logger"
     Rails.logger.info "=================="
     Rails.logger.info wikis.length
     Rails.logger.info "=================="
     Rails.logger.info "logger"
     wikis.each { |wiki| wiki.make_public }
     self
  end
  


end