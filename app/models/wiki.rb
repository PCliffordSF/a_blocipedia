class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :collaboratingusers, through: :collaborators, source: :user
  
  def make_public
     self.private = false
     self.save
     self
  end
  
end
