class DonationsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @donation = Donation.new
  end

  def index
    @donations = Donation.all
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])

    @donation = Donation.new(donation_params)

    @donation.user = @user

    if @donation.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def donation_params
    # repare que o :restaurant_id nao esta presente aqui. Nao queremos que
    # o user nos passe essa informacao (pois pegaremos ela da url)
    params.require(:donation).permit(:user_id, :blood_id)
  end
end
