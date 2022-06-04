class PagesController < ApplicationController

  def home
  end

  def signup
    @user = User.new
  end

  # may need different action code for signin
  def signin
    @user = current_user
  end
end
