require 'rails_helper'

RSpec.describe 'Api::V1::Tokens', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      role = Role.create(name: 'patient', code: 'D')

      person = Person.create! firstName: Faker::Name.first_name,
                              lastName: Faker::Name.last_name,
                              documentId: Faker::IDNumber.chilean_id,
                              phone: Faker::PhoneNumber.cell_phone_in_e164,
                              historyNumber: Faker::IDNumber.valid

      department = Department.create! name: 'Surgery',
                                      contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                      location: Faker::Address.street_address

      FactoryBot.create(:user,
                        email: 'test9999@test.com',
                        password_digest: BCrypt::Password.create('1234567890'),
                        username: 'test7777',
                        role_id: role.id,
                        department_id: department.id,
                        person_id: person.id)

      post '/api/v1/tokens',
           params: {
             user: {
               username: 'test7777',
               password: '1234567890'
             }
           }

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'should not get JWT token' do
      role = Role.create(name: 'patient')

      person = Person.create! firstName: Faker::Name.first_name,
                              lastName: Faker::Name.last_name,
                              documentId: Faker::IDNumber.chilean_id,
                              phone: Faker::PhoneNumber.cell_phone_in_e164,
                              historyNumber: Faker::IDNumber.valid

      department = Department.create! name: 'Surgery',
                                      contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                      location: Faker::Address.street_address

      FactoryBot.create(:user,
                        email: 'test9999@test.com',
                        password_digest: BCrypt::Password.create('1234567890'),
                        username: 'test7777',
                        role_id: role.id,
                        department_id: department.id,
                        person_id: person.id)

      post '/api/v1/tokens',
           params: {
             user: {
               username: 'test77778',
               password: '1234567890'
             }
           }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
