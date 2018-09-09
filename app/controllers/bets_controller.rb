
class BetsController < ApplicationController 


  before_action :require_user
  #before_action :require_same_user, only: [:edit, :update]


  def new
  
    @bet = Bet.new

  end



  def index

    #@bets = Bet.where(current_user.id == params[:user_id])


    if params[:search]
    @bets = Bet.search(params[:search]).order("created_at DESC")
    else
    @bets = Bet.first(0)
    end

   # @bets = Bet.where(["user_id  = current_user_id"])



          #@bets = Bet.where(current_user.id == :user_id).order('id desc').paginate(page: params[:page], per_page: 9)

  end

  def edit
    @bet = Bet.find(params[:id])

  end

    def destroy

      @bet = Bet.find(params[:id])
      @bet.destroy
      flash[:danger] = "Bet has been deleted."
      redirect_to bets_path

   end


  def create


    @bet = Bet.new(bet_params)
    @bet.user = current_user
    


        if @bet.save 
          flash[:success] = "Bet has been created!" 
          redirect_to fixtures_path
        else
          flash[:danger] = "Cakaaaaaalllll"
          redirect_to fixtures_path
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
      params.require(:bet).permit(:bettype,:homescore,:awayscore,:result, :fixture_id, :user_id, :week)
    end 


  def require_same_user 
    if  
        !current_user.adminflag? 
        flash[:danger] = "Cakaaaaaalllll"
        redirect_to bets_path
    
    end
  end





end