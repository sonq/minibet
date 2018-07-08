
class BetsController < ApplicationController 

  before_action :require_user





  def new
  
    @bet = Bet.new

  end



  def index

    @bets = Bet.order('id DESC').paginate(page: params[:page], per_page: 20)

  end

  def edit
    @bet = Bet.find(params[:id])

  end



  def create
    @bet = Bet.new(bet_params)
    



    @bet.user = current_user
    
    if @bet.save
      flash[:success] = "Bet has been created!"
      redirect_to bets_path
    else
      render 'new'
    end

  end


  def update
      @bet = Bet.find(params[:id])
      if @bet.update(bet_params)
        flash[:success] = "Bet is sucessfully updated."
        redirect_to bets_path
      else
        render 'edit'
      end
  end


  def show


    @bet = Bet.find(params[:id])
   


  end


  private
  def set_bet

    @bet = Bet.find(params[:id])


  end







    def bet_params
      params.require(:bet).permit(:bettype,:homescore,:awayscore,:result, :fixture_id)
    end 




end