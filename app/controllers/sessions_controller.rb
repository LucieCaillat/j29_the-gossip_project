class SessionsController < ApplicationController
  def new
  end
  
  def create

    user = User.find_by(email: params[:email])


    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Salut #{user.first_name} !"
            
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :action => 'new'
    end
  end

  

  def destroy
  end

end
