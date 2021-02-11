class Api::V1::RolesController < ApplicationController
  def index
    render json: RoleSerializer.new(Role.patient_role_id).serializable_hash , status: :ok
  end
end
