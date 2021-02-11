require 'rails_helper'

RSpec.describe "Api::V1::Departments", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/departments"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /getPatientDepartment" do
    it "returns http success" do
      get "/api/v1/departments/1/getPatientDepartment"
      expect(response).to have_http_status(:success)
    end
  end
end
