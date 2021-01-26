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

      @person4 = Person.create! firstName: Faker::Name.first_name,
                                lastName: Faker::Name.last_name,
                                documentId: Faker::IDNumber.chilean_id,
                                phone: Faker::PhoneNumber.cell_phone_in_e164,
                                historyNumber: Faker::IDNumber.valid

      @person5 = Person.create! firstName: Faker::Name.first_name,
                                lastName: Faker::Name.last_name,
                                documentId: Faker::IDNumber.chilean_id,
                                phone: Faker::PhoneNumber.cell_phone_in_e164,
                                historyNumber: Faker::IDNumber.valid
      @person6 = Person.create! firstName: Faker::Name.first_name,
                                lastName: Faker::Name.last_name,
                                documentId: Faker::IDNumber.chilean_id,
                                phone: Faker::PhoneNumber.cell_phone_in_e164,
                                historyNumber: Faker::IDNumber.valid

      @departmentDoctor = Department.create! name: 'Surgery',
                                             contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                             location: Faker::Address.street_address
      @departmentDoctor2 = Department.create! name: 'Medicine',
                                              contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                              location: Faker::Address.street_address

      @departmentPatient = Department.create! name: 'Unknow',
                                              contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                              location: Faker::Address.street_address

      @userPatient = User.create(email: 'usernamepatient1@test.com',
                                 password_digest: 'password',
                                 username: 'usernamepatient1',
                                 role_id: @rolePatient.id,
                                 department_id: @departmentPatient.id,
                                 person_id: @person.id)

      @userPatient2 = User.create(email: 'usernamepatient2@test.com',
                                  password_digest: 'password',
                                  username: 'usernamepatient2',
                                  role_id: @rolePatient.id,
                                  department_id: @departmentPatient.id,
                                  person_id: @person4.id)

      @userPatient3 = User.create(email: 'usernamepatient3@test.com',
                                  password_digest: 'password',
                                  username: 'usernamepatient3',
                                  role_id: @rolePatient.id,
                                  department_id: @departmentPatient.id,
                                  person_id: @person5.id)
      @userPatient4 = User.create(email: 'usernamepatient4@test.com',
                                  password_digest: 'password',
                                  username: 'usernamepatient4',
                                  role_id: @rolePatient.id,
                                  department_id: @departmentPatient.id,
                                  person_id: @person6.id)
      @userDoctor = User.create(email: 'usernamedoctor1@test.com',
                                password_digest: 'test2',
                                username: 'usernamedoctor1',
                                role_id: @roleDoctor.id,
                                department_id: @departmentDoctor.id,
                                person_id: @person2.id)

      @userDoctor2 = User.create(email: 'usernamedoctor2@test.com',
                                 password_digest: 'test2',
                                 username: 'usernamedoctor2',
                                 role_id: @roleDoctor.id,
                                 department_id: @departmentDoctor2.id,
                                 person_id: @person3.id)

      @appointment1 = Appointment.new(
        appointmentDate: '2021-01-22',
        startTime: '09:15',
        status: true,
        endTime: '09:30',
        user_id: @userPatient.id,
        doctor_id: @userDoctor.id
      )
      @appointment1.save!
    end

    it 'should create a new appointment first time' do
      expect {
        post '/api/v1/appointments',
             params: {
               appointment: {
                 appointmentDate: '2021-01-22',
                 startTime: '08:15',
                 status: true,
                 endTime: '08:30',
                 user_id: @userPatient3.id,
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

    it 'should not create duplicate appointment with different patient' do
      post '/api/v1/appointments',
           params: {
             appointment: {
               appointmentDate: '2021-01-22',
               startTime: '09:15',
               status: true,
               endTime: '09:30',
               user_id: @userPatient2.id,
               doctor_id: @userDoctor.id
             }
           }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should create new appointment with different doctor' do
      post '/api/v1/appointments',
           params: {
             appointment: {
               appointmentDate: '2021-01-22',
               startTime: '09:15',
               status: true,
               endTime: '09:30',
               user_id: @userPatient4.id,
               doctor_id: @userDoctor2.id
             }
           }
      expect(response).to have_http_status(:created)
    end

    it 'should create a new appointment in different days' do
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
