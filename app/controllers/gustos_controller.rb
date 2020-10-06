# frozen_string_literal: true

# Controlador del CRUD de los gustos
class GustosController < ApplicationController
  def new
    @gusto = Gusto.new
  end

  def create
    gusto_params = params.require(:gusto).permit(:nombre, :descripcion, :tipo)
    @gusto = Gusto.create(gusto_params)

    if @gusto.save
      redirect_to list_gustos_path, notice: 'Gusto agregado con éxito'
    else
      redirect_to gustos_new_path, notice: 'Ocurrió un error al crear el gusto'
    end
  end

  def index
    @gustos = Gusto.all
  end

  def show
    @gusto = Gusto.find(params[:id])
  end

  def edit
    @gusto = Gusto.find(params[:id])
  end

  def update
    gusto_params = params.require(:gusto).permit(:nombre, :descripcion, :tipo)
    @gusto = Gusto.find(params[:id])

    if @gusto.update(gusto_params)
      redirect_to list_gustos_path, notice: 'Gusto editado con éxito'
    else
      redirect_to gustos_new_path, notice: 'Ocurrió un error al editar el gusto'
    end
  end

  def destroy
    @gusto = Gusto.find(params[:id])
    @gusto.destroy
    redirect_to gustos_path, notice: 'Gusto eliminado con éxito'
  end
end
