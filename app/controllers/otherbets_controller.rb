class OtherbetsController < ApplicationController 


  
  before_action :require_user
    
  def index
    @otherbets = Otherbet.order('due DESC').reorder('username ASC')
  end
 

end

