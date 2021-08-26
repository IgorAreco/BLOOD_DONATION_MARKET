class DonationsController < ApplicationController
  def show
    @donation = Donation.find(params[:id])
  end

  def create
    @donation = Donation.new(donation_params)
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

  def donation_params
    params.require(:donation).permit(:blood_id)
  end
end
