class User < ActiveRecord::Base
  has_many :wikis
  
  after_initialize :init


  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable  , :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
         
  enum role: [:guest, :standard, :premium, :admin]
  
  def init
    self.role = :standard
  end
  
  def upgrate_to_premium
     self.role = :premium 
     self.save
  end
  
  
end
