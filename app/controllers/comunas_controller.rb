# frozen_string_literal: true

# Controlador del CRUD de las comunas
class ComunasController < ApplicationController
  def index
    @comunas = Comuna.all
  end

  def show
    @comuna = Comuna.find(params[:id])
  end

  def new
    @comunas = Comuna.new
  end

  def create
    comuna_params = params.require(:comuna).permit(:nombre)
    @comuna = Comuna.create(comuna_params)

    if @comuna.save
      redirect_to list_comunas_path, notice: 'Comuna creada con éxito'
    else
      redirect_to comunas_new_path, notice: 'Ocurrió un error al crear la comuna'
    end
  end

  def edit
    @comunas = Comuna.find(params[:id])
  end

  def update
    comuna_params = params.require(:comuna).permit(:nombre)
    @comuna = Comuna.find(params[:id])

    if @comuna.update(comuna_params)
      redirect_to comuna_path(@comuna.id), notice: 'Comuna editada con éxito'
    else
      redirect_to comunas_new_path, notice: 'Ocurrió un error al editar la comuna'
    end
  end

  def destroy
    @comuna = Comuna.find(params[:id])
    @comuna.destroy
    redirect_to comunas_path, notice: 'Comuna eliminada con éxito'
  end
end
