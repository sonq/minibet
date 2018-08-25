class OtherbetsController < ApplicationController 


  
  before_action :require_user
    
  def index
    @otherbets = Otherbet.order('username DESC')
  end
 

end

