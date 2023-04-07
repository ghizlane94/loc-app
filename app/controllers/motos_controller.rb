class MotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_moto, only: %i[show edit update destroy]
  def index
    if params[:q].present?
      @motos = policy_scope(Moto.where("LOWER(title) LIKE ?", "%" + params[:q].downcase + "%"))
    else
      @motos = policy_scope(Moto.all)
    end
  end

  def show
    # authorize @moto
    @reservation=Reservation.new
  end

  def new
    @moto = Moto.new
    authorize @moto
  end

  def create
    @moto = Moto.new(moto_params)
    authorize @moto
    @moto.user = current_user
    if @moto.save
      redirect_to moto_path(@moto)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # authorize @moto
  end

  def update
    # authorize @moto
    if @moto.update(moto_params)
      redirect_to @moto
    else
      render :edit
    end
  end

  def destroy
    # authorize @moto
    @moto.destroy
    redirect_to motos_path, notice: "Moto has been destroyed!"
  end

  private

  def set_moto
    @moto = Moto.find(params[:id])
    authorize @moto
  end

  def moto_params
    params.require(:moto).permit(:title, :description, :price, :brand, :color, :year, :mileage, :image_url)
  end

end
