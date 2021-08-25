class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bloods = Blood.all
  end

  def my_donations
    @donations = current_user.bloods
  end

  def all_donations
    @bloods = Blood.all
  end

  def user_donations
    @user = User.all
  end
end
