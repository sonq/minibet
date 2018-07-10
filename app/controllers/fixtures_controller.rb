class FixturesController < ApplicationController

  before_action :require_user
    before_action :require_same_user, only: [:edit, :update, :destroy]


  def new
    @fixture = Fixture.new
  end




  def update
      @fixture = Fixture.find(params[:id])
      if @fixture.update(fixture_params)
        flash[:success] = "Results are sucessfully updated."
        redirect_to fixtures_path
      else
        render 'edit'
      end
  end

  def destroy

      @fixture = Fixture.find(params[:id])
      @fixture.destroy
      flash[:danger] = "Match has been deleted."
      redirect_to fixtures_path

   end



  def edit
  
    @fixture = Fixture.find(params[:id])

  end


  def index
    @fixtures = Fixture.order('due DESC').paginate(page: params[:page], per_page: 20)
  end


  def create
  
    @fixture = Fixture.new(fixture_params)
    if @fixture.save
      #do something
      flash[:success] = "Fixture has been added!"
      redirect_to fixture_path(@fixture)
    else
      #flash[:danger] = "Try again!"
      render 'new'
    end





    def show

      @fixture = Fixture.find(params[:id])

    end








  end

  private
  
  def fixture_params
    params.require(:fixture).permit(:hometeam,:awayteam,:due, :homescore, :awayscore, :result,:description)
  end


  def require_same_user 
    if !current_user.adminflag?
      flash[:danger] = "Cakaaaaallll"
      redirect_to fixtures_path
    end
  end


  

end