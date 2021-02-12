require 'rails_helper'

RSpec.describe 'Api::V1::Departments', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/departments'
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET /patient_department_item' do
    it 'returns http success' do
      get '/api/v1/departments/1/patient_department_item'
      expect(response).to have_http_status(:success)
    end
  end
end
