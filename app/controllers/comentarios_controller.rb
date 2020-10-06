# frozen_string_literal: true

# Controlador del CRUD de comentarios
class ComentariosController < ApplicationController
  def new
    @comentario = Comentario.new
    session[:negocio_id_trade] = params[:negocio_id] if params[:negocio_id]
  end

  def index
    @comentarios = Comentario.all
  end

  def show
    @comentario = Comentario.find(params[:id])
  end

  def create
    comentario_params = params.require(:comentario).permit(:mensaje, :rating)

    @comentario = Comentario.create(comentario_params)
    @comentario.negocio_id = session[:negocio_id_trade]
    @comentario.user_id = current_user.id

    if @comentario.save
      establecimiento = Establecimiento.find_by(id: @comentario.negocio_id)
      suma = 0
      total_establecimientos = 0
      @comentarios = Comentario.all
      @comentarios.each do |comentario|
        if comentario.negocio_id == establecimiento.id
          suma += comentario.rating.to_f
          total_establecimientos += 1
        end
      end
      establecimiento.valoracion = (suma / total_establecimientos).round(1).to_s
      establecimiento.save

      redirect_to establecimiento_path(@comentario.negocio_id), notice: 'Comentario agregado
                                                                         con éxito'
      session.delete(:negocio_id_trade)
    else
      redirect_to comentarios_new_path, notice: 'Ocurrió un error al crear el comentario'
    end
  end

  def edit
    @comentarios = Comentario.find(params[:id])
  end

  def update
    comentario_params = params.require(:comentario).permit(:mensaje, :rating)
    @comentario = Comentario.find(params[:id])

    if @comentario.update(comentario_params)

      # esta parte actualiza la valoracion
      establecimiento = Establecimiento.find_by(id: @comentario.negocio_id)
      suma = 0
      total_establecimientos = 0
      @comentarios = Comentario.all
      @comentarios.each do |comentario|
        if comentario.negocio_id == establecimiento.id
          suma += comentario.rating.to_f
          total_establecimientos += 1
        end
      end
      establecimiento.valoracion = (suma / total_establecimientos).round(1).to_s
      establecimiento.save

      redirect_to establecimiento_path(@comentario.negocio_id), notice: 'Comentario
                                                                         editado con éxito'
    else
      redirect_to establecimiento_path(@comentario.negocio_id), notice: 'Ocurrió un error
                                                                         al editar el
                                                                         comentario'
    end
  end

  def destroy
    @comentario = Comentario.find(params[:id])
    negocio_id = @comentario.negocio_id
    @comentario.destroy

    # esta parte actualiza la valoracion
    establecimiento = Establecimiento.find_by(id: negocio_id)
    suma = 0
    total_establecimientos = 0
    @comentarios = Comentario.all
    @comentarios.each do |comentario|
      if comentario.negocio_id == establecimiento.id
        suma += comentario.rating.to_f
        total_establecimientos += 1
      end
    end
    establecimiento.valoracion = (suma / total_establecimientos).round(1).to_s
    establecimiento.save

    redirect_to establecimiento_path(negocio_id), notice: 'Comentario eliminado con éxito'
  end
end
