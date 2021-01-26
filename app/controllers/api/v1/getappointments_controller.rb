class Api::V1::GetappointmentsController < ApplicationController
  def create
    render json: AppointmentSerializer.new(
      Appointment.list_by_department_date(
        appointment_params[:department_id],
        appointment_params[:date]
      ),
      include: [:user, :person],
      
    ).serializable_hash,
           status: :ok
  end

  private

  def appointment_params
    params.require(:appointment).permit(:department_id, :date)
  end
end
