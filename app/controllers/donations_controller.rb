class DonationsController < ApplicationController
  def show
    @donation = Donation.find(params[:id])
  end

  def create
    @donation = Donation.new(blood: Blood.find(params[:blood_id]))
    if current_user.cnpj.nil?
      @donation.user = @donation.blood.user
      @donation.blood.update(user: current_user, offer: true, available: false)
    else
      @donation.user = current_user
      @donation.blood.update(available: false)
    end

    if @donation.save
      redirect_to my_donations_path
    else
      render :new
    end
  end
end
