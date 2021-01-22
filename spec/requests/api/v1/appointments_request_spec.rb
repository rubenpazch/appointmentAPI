require 'rails_helper'

RSpec.describe "Api::V1::Appointments", type: :request do
  describe 'POST /  appointments' do
    before(:each) do
      role = Role.create(name: 'patient')

      person = Person.create! firstName: Faker::Name.first_name,
                              lastName: Faker::Name.last_name,
                              documentId: Faker::IDNumber.chilean_id,
                              phone: Faker::PhoneNumber.cell_phone_in_e164,
                              historyNumber: Faker::IDNumber.valid

      person2 = Person.create! firstName: Faker::Name.first_name,
                               lastName: Faker::Name.last_name,
                               documentId: Faker::IDNumber.chilean_id,
                               phone: Faker::PhoneNumber.cell_phone_in_e164,
                               historyNumber: Faker::IDNumber.valid

      person3 = Person.create! firstName: Faker::Name.first_name,
                               lastName: Faker::Name.last_name,
                               documentId: Faker::IDNumber.chilean_id,
                               phone: Faker::PhoneNumber.cell_phone_in_e164,
                               historyNumber: Faker::IDNumber.valid

      department = Department.create! name: 'Surgery',
                                      contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                      location: Faker::Address.street_address
      User.create(email: 'test1@test.com',
                  password_digest: 'test2',
                  username: 'testusername1',
                  role_id: role.id,
                  department_id: department.id,
                  person_id: person.id)

      User.create(email: 'test2@test.com',
                  password_digest: 'test2',
                  username: 'testusername2',
                  role_id: role.id,
                  department_id: department.id,
                  person_id: person2.id)
    end

    # it 'should create a new appointment' do
    #   expect {
    #     post '/api/v1/appointments',
    #          params: {
    #            appointment: {
    #              appointmentDate: '2021-01-22',
    #              startTime: '08:15',
    #              status: true,
    #              endTime: '08:30',
    #              user_id: User.first.id,
    #              doctor_id: User.last.id
    #            }
    #          }
    #   }.to change { Appointment.count }.from(1).to(2)
    #   expect(response).to have_http_status(:created)
    # end
  end
end
