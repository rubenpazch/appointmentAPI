class Api::V1::AppointmentsController < ApplicationController
  def index
    render 
json: AppointmentSerializer.new(Appointment.list_by_department_date(params[:department_id], params[:date])).serializable_hash, status: :ok
  end

  # private
  # def appointment_params
  #   params.require(:appointment).permit(:department_id, :date)
  # end
end
