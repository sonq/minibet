class TabelasController < ApplicationController 


  
  before_action :require_user
    
  def index
    @tabelas = Tabela.order('sum DESC')
  end
 

end

