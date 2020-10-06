# frozen_string_literal: true

# Controlador de los filtros de busqueda
class FiltrosController < ApplicationController
  def new
    @filtro = Filtro.new
  end

  def create
    filtro_params = params.require(:filtro)

    @filtro = Filtro.create(filtro_params)
    @filtro.filtro_id = current_user.id
    @filtro.comuna = current_user.comuna
    @filtro.genero = current_user.genero
    @filtro.edad_min = 18
    @filtro.edad_max = 99
    @filtro.gustos = 'false'
  end

  def edit
    @filtro = Filtro.find(params[:id])
  end

  def update
    filtro_params = params.require(:filtro).permit(:comuna, :genero,
                                                   :edad_min, :edad_max,
                                                   :gustos)
    @filtro = Filtro.find(params[:id])

    redirect_to list_users_path if @filtro.update(filtro_params)
  end

  def show
    @filtro = Filtro.find(params[:id])
  end
end
