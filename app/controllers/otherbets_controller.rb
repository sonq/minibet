class OtherbetsController < ApplicationController 


  
  before_action :require_user
    
  def index
    @otherbets = Otherbet.order('due ASC').paginate(page: params[:page], per_page: 81)
  end
 

end

