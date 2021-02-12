require 'rails_helper'

RSpec.describe 'Api::V1::Getappointments', type: :request do
  describe 'GET /create' do
    before(:each) do
      @department = Department.create! name: 'Surgery',
                                       contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                       location: Faker::Address.street_address
    end
    it 'returns http success' do
      post '/api/v1/getappointments',
           params: {
             appointment: {
               department_id: @department.id,
               date: '2021-01-22'
             }
           }
      expect(response).to have_http_status(:success)
    end
  end
end
