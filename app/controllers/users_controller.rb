class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update,:show]
  #before_action :require_user
    before_action :require_same_user, only: [:edit, :update, :destroy]




  def new

    @user = User.new

  end


  def index

    @users = User.paginate(page: params[:page], per_page: 20)

  end



  def edit

      @user = User.find(params[:id])  

  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Account is updated successfully" 
      redirect_to users_path

      else
      render 'edit'
    end
  end
  



  

  def show


 @user = User.find(params[:id])

  end


  def destroy

    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User is deleted!"
    redirect_to users_path


  end




  def create
    @user = User.new(user_params)

    if @user.save

      #send email
      UserMailer.signup_confirmation(@user).deliver


      #session automatically signs users in that signed up after submittin in sign up page
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the TaqTaq #{@user.username}"
      redirect_to home_path
    else

      render 'new'

    end
  end


  private
  def user_params
    params.require(:user).permit(:username,:usertype, :useradmin, :password, :adminflag, :usermail)
  end

  def set_user
    @user = User.find(params[:id])
  end


  def require_same_user 
    if current_user != @user and !current_user.adminflag?
      flash[:danger] = "You can edit only your own account"
      redirect_to users_path
    end
  end


  


  end