# frozen_string_literal: true

# Controlador del CRUD de las citas
class AppointmentsController < ApplicationController
  def new
    @appointments = Appointment.new
    session[:match_id_trade] = params[:match_id] if params[:match_id]
  end

  def index
    @appointments = Appointment.where(user_id: current_user.id).or(Appointment.where(
                                                                     wanted: current_user.id
                                                                   ))
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    appointment_params = params.require(:appointment).permit(:fecha,
                                                             :establecimiento_id,
                                                             :hora)
    match = Match.find_by(id: session[:match_id_trade])
    @appointment = Appointment.create(appointment_params)
    @appointment.user_id = current_user.id
    @appointment.match_id = session[:match_id_trade]
    @appointment.wanted = if match.matcher_id == current_user.id
                            match.matched_id
                          else
                            match.matcher_id
                          end

    if @appointment.save
      redirect_to list_appointments_path, notice: 'Cita agregada con éxito'
      session.delete(:match_id_trade)
    else
      redirect_to appointments_new_path, notice: 'Ocurrió un error al crear la cita'
    end
  end

  def edit
    @appointments = Appointment.find(params[:id])
  end

  def update
    appointment_params = params.permit(:status, :accomplished, :id)
    @appointment = Appointment.find(appointment_params[:id])

    if @appointment.update(appointment_params)
      redirect_to list_appointments_path, notice: 'Cita editada con éxito'
    else
      redirect_to appointments_new_path, notice: 'Ocurrió un error al editar la cita'
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path, notice: 'Cita eliminada con éxito'
  end
end
