class User < ActiveRecord::Base
  has_many :wikis
  
  after_initialize :init

  def init
    self.role = 1
  end
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable  , :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
         
  enum role: [:guest, :standard, :premium, :admin]
end
