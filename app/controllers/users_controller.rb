class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(post_params)
    redirect_to new_session_path
  end

  def create
    
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name],email: params[:email], description: params[:description], age: params[:age].to_i, city: City.find_by(name: params[:city]), password: params[:password], password_confirmation: params[:password_confirmation] )

    if @user.save
      redirect_to root_path, notice: "Bienvenue dans The Gossip Project"
    else
      flash.now[:alert] = "mauvaises entrées de formulaire"
      render :action => 'new'
    end
  end

   
   
    
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end
    
  private
    
  def post_params
    params.require(:user).permit( :first_name, :last_name, :email, :description , :age, :city, :password, :password_confirmation )
  end
end
