class BloodsController < ApplicationController
  def new
    @blood = Blood.new
  end

  def index
    @bloods = Blood.where.not(latitude: nil, longitude: nil, available: true)

    @markers = @bloods.geocoded.map do |blood|
      {
        lat: blood.latitude,
        lng: blood.longitude,
        info_window: render_to_string(partial: "info_window", locals: { blood: blood })
      }
    end
  end

  def show
    @blood = Blood.find(params[:id])
  end

  def create
    @blood = Blood.new(blood_params)
    @blood.user = current_user
    @blood.address = current_user.address if @blood.address.empty?
    @blood.offer = current_user.cnpj.nil?

    if @blood.save
      redirect_to bloods_path
    else
      render :new
    end
  end

  private

  def blood_params
    params.require(:blood).permit(:blood_type, :address)
  end
end
