require 'rails_helper'

RSpec.describe "Api::V1::Appointments", type: :request do
  describe 'POST /  appointments' do
    before(:each) do
      @rolePatient = Role.create(name: 'patient')
      @roleDoctor = Role.create(name: 'doctor')

      @person = Person.create! firstName: Faker::Name.first_name,
                               lastName: Faker::Name.last_name,
                               documentId: Faker::IDNumber.chilean_id,
                               phone: Faker::PhoneNumber.cell_phone_in_e164,
                               historyNumber: Faker::IDNumber.valid

      @person2 = Person.create! firstName: Faker::Name.first_name,
                                lastName: Faker::Name.last_name,
                                documentId: Faker::IDNumber.chilean_id,
                                phone: Faker::PhoneNumber.cell_phone_in_e164,
                                historyNumber: Faker::IDNumber.valid
      @person3 = Person.create! firstName: Faker::Name.first_name,
                                lastName: Faker::Name.last_name,
                                documentId: Faker::IDNumber.chilean_id,
                                phone: Faker::PhoneNumber.cell_phone_in_e164,
                                historyNumber: Faker::IDNumber.valid
      @departmentDoctor = Department.create! name: 'Surgery',
                                             contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                             location: Faker::Address.street_address

      @departmentPatient = Department.create! name: 'Unknow',
                                              contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                              location: Faker::Address.street_address

      @userPatient = User.create(email: 'test1@test.com',
                                 password_digest: 'test2',
                                 username: 'testusername1',
                                 role_id: @rolePatient.id,
                                 department_id: @departmentPatient.id,
                                 person_id: @person.id)

      @userDoctor = User.create(email: 'test2@test.com',
                                password_digest: 'test2',
                                username: 'testusername2',
                                role_id: @roleDoctor.id,
                                department_id: @departmentDoctor.id,
                                person_id: @person2.id)

      @userDoctor2 = User.create(email: 'test2@test.com',
                                password_digest: 'test2',
                                username: 'testusername2',
                                role_id: @roleDoctor.id,
                                department_id: @departmentDoctor.id,
                                person_id: @person3.id)

      Appointment.create(
        appointmentDate: '2021-01-22',
        startTime: '09:15',
        status: true,
        endTime: '09:30',
        user_id: @userPatient.id,
        doctor_id: @userDoctor.id
      )
    end

    it 'should create a new appointment' do
      expect {
        post '/api/v1/appointments',
             params: {
               appointment: {
                 appointmentDate: '2021-01-22',
                 startTime: '08:15',
                 status: true,
                 endTime: '08:30',
                 user_id: @userPatient.id,
                 doctor_id: @userDoctor.id
               }
             }
      }.to change { Appointment.count }.from(1).to(2)
      expect(response).to have_http_status(:created)
    end

    it 'should not create duplicate appointment' do
      post '/api/v1/appointments',
           params: {
             appointment: {
               appointmentDate: '2021-01-22',
               startTime: '09:15',
               status: true,
               endTime: '09:30',
               user_id: @userPatient.id,
               doctor_id: @userDoctor.id
             }
           }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should create new appointment different department' do
      post '/api/v1/appointments',
           params: {
             appointment: {
               appointmentDate: '2021-01-22',
               startTime: '09:15',
               status: true,
               endTime: '09:30',
               user_id: @userPatient.id,
               doctor_id: @userDoctor2.id
             }
           }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should create a new appointment' do
      expect {
        post '/api/v1/appointments',
             params: {
               appointment: {
                 appointmentDate: '2021-01-23',
                 startTime: '09:15',
                 status: true,
                 endTime: '09:30',
                 user_id: @userPatient.id,
                 doctor_id: @userDoctor.id
               }
             }
      }.to change { Appointment.count }.from(1).to(2)
      expect(response).to have_http_status(:created)
    end
  end
end
