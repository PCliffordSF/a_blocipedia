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
     Rails.logger.info  "inside upgrade_to_premium"
     Rails.logger.info  "------------------------"
     self.role = :premium 
     Rails.logger.info self.role.inspect
     Rails.logger.info  "--------self.role.inspect----------------"
     if self.save
        Rails.logger.info  "save worked"
        Rails.logger.info  "------------------------"
        Rails.logger.info self.reload
        Rails.logger.info self.reload.role
        Rails.logger.info  "=======self.reload.role================="
     else
         Rails.logger.info  "save didn't work"
     end
     Rails.logger.info  "========================"
     Rails.logger.info self.errors.inspect
     Rails.logger.info  "========================"
     self
  end
end
