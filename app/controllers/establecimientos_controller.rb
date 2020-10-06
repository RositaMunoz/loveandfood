# frozen_string_literal: true

# Controlador del CRUD de establecimientos
class EstablecimientosController < ApplicationController
  def new
    @establecimiento = Establecimiento.new
  end

  def create
    establecimiento_params = params.require(:establecimiento).permit(:nombre, :tipo,
                                                                     :descripcion, :comuna_id,
                                                                     :adress, :profile_image,
                                                                     images: [])

    @establecimiento = Establecimiento.create(establecimiento_params)
    @establecimiento.valoracion = 0

    @establecimiento.aceptado = 'pendiente'
    @establecimiento.user_id = current_user.id
    if establecimiento_params[:profile_image]
      @establecimiento.profile_image.attach(establecimiento_params[:profile_image])
    end

    if @establecimiento.save
      redirect_to list_establecimientos_path, notice: 'Postulacion enviada con exito'
    else
      redirect_to establecimientos_new_path, notice: 'Ocurrió un error al postular
      el establecimiento'
    end
  end

  def index
    @establecimientos = Establecimiento.all
  end

  def show
    @establecimiento = Establecimiento.find(params[:id])
    @comuna = Comuna.find_by(id: @establecimiento.comuna_id)
  end

  def edit
    @establecimiento = Establecimiento.find(params[:id])
  end

  def update
    establecimiento_params = params.require(:establecimiento).permit(:nombre, :tipo,
                                                                     :descripcion, :comuna_id,
                                                                     :valoracion, :aceptado,
                                                                     :adress, :profile_image,
                                                                     images: [])
    @establecimiento = Establecimiento.find(params[:id])

    if @establecimiento.update(establecimiento_params)
      if establecimiento_params[:profile_image]
        # @establecimiento.profile_image.purge_later
        @establecimiento.profile_image.attach(establecimiento_params[:profile_image])
      elsif establecimiento_params[:images]
        @establecimiento.images.purge_later
        @establecimiento.images.attach(establecimiento_params[:images])
      end
      redirect_to list_establecimientos_path, notice:
      'Establecimiento editado con éxito'
    else
      redirect_to establecimientos_edit_path, notice:
      'Ocurrió un error al editar el establecimiento'
    end
  end

  # def change_rating
  #     if params[:rating]
  #         session[:rating_trade] = params[:rating]
  #     end
  # @establecimiento.valoracion = session[:rating_trade]
  # puts @establecimiento.valoracion
  # @establecimiento.save
  # end
  def destroy
    @establecimiento = Establecimiento.find(params[:id])
    @establecimiento.destroy
    redirect_to establecimientos_path, notice: 'Establecimiento eliminado con éxito'
  end
end
