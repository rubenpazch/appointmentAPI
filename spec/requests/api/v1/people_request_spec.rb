require 'rails_helper'

RSpec.describe "Api::V1::People", type: :request do
  describe 'POST /person' do
    before(:each) do
      person = Person.create! firstName: Faker::Name.first_name,
                              lastName: Faker::Name.last_name,
                              documentId: Faker::IDNumber.chilean_id,
                              phone: Faker::PhoneNumber.cell_phone_in_e164,
                              historyNumber: Faker::IDNumber.valid
    end

    # it 'should create a new person' do
    #   expect {
    #     post '/api/v1/people',
    #          params: {
    #            user: {
    #               firstName: Faker::Name.first_name,
    #               lastName: Faker::Name.last_name,
    #               documentId: Faker::IDNumber.chilean_id,
    #               phone: Faker::PhoneNumber.cell_phone_in_e164,
    #               historyNumber: Faker::IDNumber.valid
    #            }
    #          }
    #   }.to change { User.count }.from(1).to(2)
    #   expect(response).to have_http_status(:created)
    # end
  end
end
