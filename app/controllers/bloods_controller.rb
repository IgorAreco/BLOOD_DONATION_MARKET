class BloodsController < ApplicationController
  def new
    @blood = Blood.new
  end

  def index
    @bloods = Blood.where.not(latitude: nil, longitude: nil)

    @markers = @bloods.geocoded.map do |blood|
      {
        lat: blood.latitude,
        lng: blood.longitude,
        #info_window: render_to_string(partial: "info_window", locals: { blood: blood })
      }
    end
  end

  def show
    @blood = Blood.find(params[:id])
  end

  def create
    @blood = Blood.new(blood_params)

    @blood.user = current_user

    if @blood.save
      redirect_to my_donations_path
    else
      render :new
    end
  end

  private

  def blood_params
    # repare que o :restaurant_id nao esta presente aqui. Nao queremos que
    # o user nos passe essa informacao (pois pegaremos ela da url)
    params.require(:blood).permit(:quantity, :location)
  end
end
