class Api::V1::DoctorCalendarsController < ApplicationController
  def index
    render json: DoctorCalendarSerializer.new(DoctorCalendar.all).serializable_hash, status: :ok
  end
end
