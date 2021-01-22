class Api::V1::AppointmentsController < ApplicationController
  def index
    render json: AppointmentSerializer.new(
      Appointment.list_by_department_date(
        appointment_params[:department_id], 
        appointment_params[:date])).serializable_hash, 
        status: :ok
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: AppointmentSerializer.new
      (@appointment).serializable_hash, 
      status: :created
    else
      render json: @appointment.errors, 
      status: :unprocessable_entity
    end
  end
  # SELECT id, "appointmentDate", "startTime", "endTime", status, user_id, created_at, updated_at, doctor_id

  private

  def appointment_params
    params
    .require(:appointment)
    .permit(
      :appointmentDate, 
      :startTime, 
      :endTime, 
      :status, 
      :user_id, 
      :doctor_id)
  end
end
