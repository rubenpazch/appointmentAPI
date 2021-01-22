class Api::V1::DepartmentsController < ApplicationController
  def index
    render json: DepartmentSerializer.new(Department.list_doctor_departments).serializable_hash, status: :ok
  end
end
