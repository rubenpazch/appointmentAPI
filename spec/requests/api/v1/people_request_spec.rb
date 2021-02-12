# rubocop:disable Lint/UselessAssignment
require 'rails_helper'

RSpec.describe 'Api::V1::People', type: :request do
  describe 'POST /person' do
    before(:each) do
      person = Person.create! firstName: Faker::Name.first_name,
                              lastName: Faker::Name.last_name,
                              documentId: Faker::IDNumber.chilean_id,
                              phone: Faker::PhoneNumber.cell_phone_in_e164,
                              historyNumber: Faker::IDNumber.valid

      person = Person.create! firstName: 'Raul',
                              lastName: 'Paz',
                              documentId: Faker::IDNumber.chilean_id,
                              phone: Faker::PhoneNumber.cell_phone_in_e164,
                              historyNumber: Faker::IDNumber.valid
    end

    it 'should create a new person' do
      expect do
        post '/api/v1/people/',
             params: {
               person: {
                 firstName: Faker::Name.first_name,
                 lastName: Faker::Name.last_name,
                 documentId: Faker::IDNumber.chilean_id,
                 phone: Faker::PhoneNumber.cell_phone_in_e164,
                 historyNumber: Faker::IDNumber.valid
               }
             }
      end.to change { Person.count }.from(2).to(3)
      expect(response).to have_http_status(:created)
    end

    it 'should not create duplicate person' do
      expect do
        post '/api/v1/people/',
             params: {
               person: {
                 firstName: Faker::Name.first_name,
                 lastName: Faker::Name.last_name,
                 documentId: Faker::IDNumber.chilean_id,
                 phone: Faker::PhoneNumber.cell_phone_in_e164,
                 historyNumber: Faker::IDNumber.valid
               }
             }
      end.to change { Person.count }.from(2).to(3)
      expect(response).to have_http_status(:created)
    end
  end
end
# rubocop:enable Lint/UselessAssignment
