class WikiPolicy < ApplicationPolicy
    attr_reader :user, :record
    
  def index?
    user.admin?
  end
end