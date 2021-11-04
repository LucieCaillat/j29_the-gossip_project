class StaticController < ApplicationController
  def home
    @users = User.all
  end

  def team
  end

  def contact
  end
end
