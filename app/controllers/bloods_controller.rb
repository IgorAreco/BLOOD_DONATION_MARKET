class BloodsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @blood = Blood.new
  end

  def index
    @bloods = Blood.all
  end

  def show
    @blood = Blood.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])

    @blood = Blood.new(blood_params)

    @blood.user = @user

    if @blood.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def blood_params
    # repare que o :restaurant_id nao esta presente aqui. Nao queremos que
    # o user nos passe essa informacao (pois pegaremos ela da url)
    params.require(:blood).permit(:user_id, :quantity, :location)
  end
end
