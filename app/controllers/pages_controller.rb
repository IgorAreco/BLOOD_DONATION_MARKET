class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bloods = Blood.all
  end

  def my_donations
    @bloods = current_user.bloods
    if current_user.cnpj.nil?
      @donations = Donation.includes(blood: [:user]).where(bloods: { user: current_user })
    else
      @donations = current_user.donations
    end
  end

  def all_donations
    @bloods = if current_user.cnpj.nil?
                Blood.where(offer: false)
              else
                Blood.where(offer: true)
              end
  end
end
