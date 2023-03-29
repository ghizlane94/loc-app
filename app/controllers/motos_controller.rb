class MotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @motos = Moto.all
  end

  def show
    @moto = Moto.find(params[:id])
  end
  def new
    @moto = Moto.new
  end
  def create
    @moto = Moto.new(moto_params)
    @moto.user = current_user
    if @moto.save
      redirect_to moto_path(@moto)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @moto = Moto.find(params[:id])
  end
  def update
    @moto = Moto.find(params[:id])
    if @moto.update(moto_params)
      redirect_to @moto
    else
      render :edit
    end
  end
  def destroy
    @moto = Moto.find(params[:id])
    @moto.destroy
    redirect_to motos_path, notice: "Moto has been destroyed!"
  end
  private

  def moto_params
    params.require(:moto).permit(:title, :description, :price, :brand, :color, :year, :mileage, :photo)
  end

end
