class TabelasController < ApplicationController 


  
    
  def index
    @tabelas = Tabela.order('sum DESC')
  end
 

end

