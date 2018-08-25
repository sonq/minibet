class OtherbetsController < ApplicationController 


  
  before_action :require_user
    
  def index
    @otherbets = Otherbet.order(due: :desc, username: :asc)
  end
 

end

