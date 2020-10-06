# frozen_string_literal: true

# Controlador de CRUD de usuarios
class UsersController < ApplicationController
  def index
    tiene_filtro = false
    @filtros = Filtro.all
    @filtros.each do |filtro|
      tiene_filtro = true if filtro.user_id == current_user.id
    end

    if tiene_filtro == false
      @filtro = Filtro.new
      @filtro = Filtro.create(user_id: current_user.id, comuna: current_user.comuna_id,
                              genero: current_user.gender, edad_min: 18, edad_max: 99,
                              gustos: 'No')
    end

    @filtro = nil
    @filtros = Filtro.all
    @filtros.each do |filtro|
      @filtro = filtro if filtro.user_id == current_user.id
    end
    @users = []
    @filtro1 = []
    @filtro2 = []
    @filtro3 = []
    @usuarios = User.all
    @usuarios.each do |user|
      unless (@filtro.comuna.to_i == user.comuna_id.to_i) && (@filtro.genero == user.gender)
        next
      end

      @filtro1 << user
    end

    @filtro1.each do |user|
      unless (@filtro.edad_min.to_i <= user.age.to_i) &&
             (@filtro.edad_max.to_i >= user.age.to_i)
        next
      end

      @filtro2 << user
    end

    @filtro2.each do |user|
      if @filtro.gustos == 'Si'
        if (current_user.deporte == user.deporte) || (current_user.musica == user.musica) ||
           (current_user.comida == user.comida) || (current_user.genero_pelicula ==
           user.genero_pelicula)
          @filtro3 << user
        end
        @users = @filtro3
      elsif @filtro.gustos == 'No'
        @users = @filtro2
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user_params = params.require(:user).permit(:name, :age, :date_of_birth, :gender,
                                               :description, :phone_number, :email,
                                               :password, :comuna_id, :role)
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to adminpanel_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @matches = Match.where(matcher_id: params[:id])
    @matches2 = Match.where(matched_id: params[:id])
    if @matches
      @matches.each(&:destroy)
    elsif @matches2
      @matches2.each(&:destroy)
    end
    if @user.destroy
      redirect_to list_users_path, notice: 'Usuario eliminado con éxito'
    else
      redirect_to users_index_path, flash: { error: 'Usuario no pudo ser eliminado' }
    end
  end
end
