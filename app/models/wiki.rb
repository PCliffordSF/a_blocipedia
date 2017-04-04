class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :colaborators, through: :users
  
  def make_public
     self.private = false
     self.save
     self
  end
  
end
