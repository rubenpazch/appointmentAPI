# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Appointment.delete_all
Shift.delete_all
User.delete_all
Role.delete_all
Person.delete_all
DoctorCalendar.delete_all
Department.delete_all


role1 = Role.create(name: 'Admin', code: 'A')
role2 = Role.create(name: 'Doctor', code: 'D')
role3 = Role.create(name: 'Patient', code: 'P')
 
department1 = Department.create! name: 'Surgery', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address
department2 = Department.create! name: 'Medicine', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address
department3 = Department.create! name: 'Cancer Care', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address
department4 = Department.create! name: 'Urology', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address
department5 = Department.create! name: 'Unknow', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address
department6 = Department.create! name: 'Administrator', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address


shift1 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department1.id
shift2 = Shift.create! totalShift: 16, interval: 30,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department2.id
shift3 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department3.id
shift4 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department4.id
shift5 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department5.id



# Create Admin Data
person = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role1.id, person_id: person.id, department_id: department6.id

person = Person.create! firstName: 'administrator', lastName: 'superuser', documentId: '32547698' , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
User.create! email: 'rubenpazchuspe@outlook.com', password: '1234567890', username: 'rpazchuspe', role_id: role1.id, person_id: person.id, department_id: department6.id

  
# Create Doctors data
1.times do 
  person1 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
  userDoctor1 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person1.id, department_id: department1.id

  DoctorCalendar.create! startDate: '2021-02-01', endDate: '2021-02-01', startTime: '2021-02-01 08:00 AM', endTime: '2021-02-01 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-02', endDate: '2021-02-02', startTime: '2021-02-02 08:00 AM', endTime: '2021-02-02 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-03', endDate: '2021-02-03', startTime: '2021-02-03 08:00 AM', endTime: '2021-02-03 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-04', endDate: '2021-02-04', startTime: '2021-02-04 08:00 AM', endTime: '2021-02-04 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-05', endDate: '2021-02-05', startTime: '2021-02-05 08:00 AM', endTime: '2021-02-05 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-06', endDate: '2021-02-06', startTime: '2021-02-06 08:00 AM', endTime: '2021-02-06 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-07', endDate: '2021-02-07', startTime: '2021-02-07 08:00 AM', endTime: '2021-02-07 16:00 PM', totalHours: 8, user_id: userDoctor1.id

  DoctorCalendar.create! startDate: '2021-02-11', endDate: '2021-02-11', startTime: '2021-02-11 08:00 AM', endTime: '2021-02-11 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-12', endDate: '2021-02-12', startTime: '2021-02-12 08:00 AM', endTime: '2021-02-12 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-13', endDate: '2021-02-13', startTime: '2021-02-13 08:00 AM', endTime: '2021-02-13 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-14', endDate: '2021-02-14', startTime: '2021-02-14 08:00 AM', endTime: '2021-02-14 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-15', endDate: '2021-02-15', startTime: '2021-02-15 08:00 AM', endTime: '2021-02-15 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-16', endDate: '2021-02-16', startTime: '2021-02-16 08:00 AM', endTime: '2021-02-16 16:00 PM', totalHours: 8, user_id: userDoctor1.id
  DoctorCalendar.create! startDate: '2021-02-17', endDate: '2021-02-17', startTime: '2021-02-17 08:00 AM', endTime: '2021-02-17 16:00 PM', totalHours: 8, user_id: userDoctor1.id
end

1.times do 
  person2 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
  userDoctor2 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person2.id, department_id: department2.id

  DoctorCalendar.create! startDate: '2021-02-01', endDate: '2021-02-01', startTime: '2021-02-01 16:00 PM', endTime: '2021-02-01 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-02', endDate: '2021-02-02', startTime: '2021-02-02 16:00 PM', endTime: '2021-02-02 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-03', endDate: '2021-02-03', startTime: '2021-02-03 16:00 PM', endTime: '2021-02-03 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-04', endDate: '2021-02-04', startTime: '2021-02-04 16:00 PM', endTime: '2021-02-04 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-05', endDate: '2021-02-05', startTime: '2021-02-05 16:00 PM', endTime: '2021-02-05 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-06', endDate: '2021-02-06', startTime: '2021-02-06 16:00 PM', endTime: '2021-02-06 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-07', endDate: '2021-02-07', startTime: '2021-02-07 16:00 PM', endTime: '2021-02-07 12:00 AM', totalHours: 8, user_id: userDoctor2.id

  DoctorCalendar.create! startDate: '2021-02-11', endDate: '2021-02-11', startTime: '2021-02-11 16:00 PM', endTime: '2021-02-11 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-12', endDate: '2021-02-12', startTime: '2021-02-12 16:00 PM', endTime: '2021-02-12 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-13', endDate: '2021-02-13', startTime: '2021-02-13 16:00 PM', endTime: '2021-02-13 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-14', endDate: '2021-02-14', startTime: '2021-02-14 16:00 PM', endTime: '2021-02-14 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-15', endDate: '2021-02-15', startTime: '2021-02-15 16:00 PM', endTime: '2021-02-15 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-16', endDate: '2021-02-16', startTime: '2021-02-16 16:00 PM', endTime: '2021-02-16 12:00 AM', totalHours: 8, user_id: userDoctor2.id
  DoctorCalendar.create! startDate: '2021-02-17', endDate: '2021-02-17', startTime: '2021-02-17 16:00 PM', endTime: '2021-02-17 12:00 AM', totalHours: 8, user_id: userDoctor2.id
end

1.times do 
  person3 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
  userDoctor3 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person3.id, department_id: department3.id

  DoctorCalendar.create! startDate: '2021-02-01', endDate: '2021-02-01', startTime: '2021-02-01 08:00 AM', endTime: '2021-02-01 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-02', endDate: '2021-02-02', startTime: '2021-02-02 08:00 AM', endTime: '2021-02-02 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-03', endDate: '2021-02-03', startTime: '2021-02-03 08:00 AM', endTime: '2021-02-03 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-04', endDate: '2021-02-04', startTime: '2021-02-04 08:00 AM', endTime: '2021-02-04 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-05', endDate: '2021-02-05', startTime: '2021-02-05 08:00 AM', endTime: '2021-02-05 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-06', endDate: '2021-02-06', startTime: '2021-02-06 08:00 AM', endTime: '2021-02-06 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-07', endDate: '2021-02-07', startTime: '2021-02-07 08:00 AM', endTime: '2021-02-07 16:00 PM', totalHours: 8, user_id: userDoctor3.id

  DoctorCalendar.create! startDate: '2021-02-11', endDate: '2021-02-11', startTime: '2021-02-11 08:00 AM', endTime: '2021-02-11 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-12', endDate: '2021-02-12', startTime: '2021-02-12 08:00 AM', endTime: '2021-02-12 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-13', endDate: '2021-02-13', startTime: '2021-02-13 08:00 AM', endTime: '2021-02-13 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-14', endDate: '2021-02-14', startTime: '2021-02-14 08:00 AM', endTime: '2021-02-14 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-15', endDate: '2021-02-15', startTime: '2021-02-15 08:00 AM', endTime: '2021-02-15 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-16', endDate: '2021-02-16', startTime: '2021-02-16 08:00 AM', endTime: '2021-02-16 16:00 PM', totalHours: 8, user_id: userDoctor3.id
  DoctorCalendar.create! startDate: '2021-02-17', endDate: '2021-02-17', startTime: '2021-02-17 08:00 AM', endTime: '2021-02-17 16:00 PM', totalHours: 8, user_id: userDoctor3.id
end

1.times do 
  person4 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
  userDoctor4 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person4.id, department_id: department4.id

  DoctorCalendar.create! startDate: '2021-02-01', endDate: '2021-02-01', startTime: '2021-02-01 16:00 PM', endTime: '2021-02-01 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-02', endDate: '2021-02-02', startTime: '2021-02-02 16:00 PM', endTime: '2021-02-02 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-03', endDate: '2021-02-03', startTime: '2021-02-03 16:00 PM', endTime: '2021-02-03 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-04', endDate: '2021-02-04', startTime: '2021-02-04 16:00 PM', endTime: '2021-02-04 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-05', endDate: '2021-02-05', startTime: '2021-02-05 16:00 PM', endTime: '2021-02-05 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-06', endDate: '2021-02-06', startTime: '2021-02-06 16:00 PM', endTime: '2021-02-06 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-07', endDate: '2021-02-07', startTime: '2021-02-07 16:00 PM', endTime: '2021-02-07 12:00 AM', totalHours: 8, user_id: userDoctor4.id

  DoctorCalendar.create! startDate: '2021-02-11', endDate: '2021-02-11', startTime: '2021-02-11 16:00 PM', endTime: '2021-02-11 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-12', endDate: '2021-02-12', startTime: '2021-02-12 16:00 PM', endTime: '2021-02-12 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-13', endDate: '2021-02-13', startTime: '2021-02-13 16:00 PM', endTime: '2021-02-13 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-14', endDate: '2021-02-14', startTime: '2021-02-14 16:00 PM', endTime: '2021-02-14 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-15', endDate: '2021-02-15', startTime: '2021-02-15 16:00 PM', endTime: '2021-02-15 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-16', endDate: '2021-02-16', startTime: '2021-02-16 16:00 PM', endTime: '2021-02-16 12:00 AM', totalHours: 8, user_id: userDoctor4.id
  DoctorCalendar.create! startDate: '2021-02-17', endDate: '2021-02-17', startTime: '2021-02-17 16:00 PM', endTime: '2021-02-17 12:00 AM', totalHours: 8, user_id: userDoctor4.id
end

DoctorUsers = User.where(:role_id => role2.id).all
maximumUserId = DoctorUsers.maximum(:id)

# Create Admin Data

# Medicine

personPatient1 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient1 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient1.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-17', startTime: '2021-02-17 8:00 AM', endTime: '2021-02-17 8:15 AM', status: true, user_id: userpatient1.id, doctor_id: maximumUserId

personPatient2 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient2 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient2.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-17', startTime: '2021-02-17 8:15 AM', endTime: '2021-02-17 8:30 AM', status: true, user_id: userpatient2.id, doctor_id: maximumUserId

personPatient3 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient3 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient3.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-17', startTime: '2021-02-17 8:30 AM', endTime: '2021-02-17 8:45 AM', status: true, user_id: userpatient3.id, doctor_id: maximumUserId

personPatient4 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient4 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient4.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-18', startTime: '2021-02-18 8:00 AM', endTime: '2021-02-18 8:15 AM', status: true, user_id: userpatient4.id, doctor_id: maximumUserId

personPatient5 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient5 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient5.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-18', startTime: '2021-02-18 8:15 AM', endTime: '2021-02-18 8:30 AM', status: true, user_id: userpatient5.id, doctor_id: maximumUserId

personPatient6 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient6 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient6.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-18', startTime: '2021-02-18 8:30 AM', endTime: '2021-02-18 8:45 AM', status: true, user_id: userpatient6.id, doctor_id: maximumUserId

# Surgery

maximumUserId = maximumUserId - 1

personPatient7 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient7 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient7.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-17', startTime: '2021-02-17 8:00 AM', endTime: '2021-02-17 8:15 AM', status: true, user_id: userpatient7.id, doctor_id: maximumUserId

personPatient8 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient8 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient8.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-17', startTime: '2021-02-17 8:15 AM', endTime: '2021-02-17 8:30 AM', status: true, user_id: userpatient8.id, doctor_id: maximumUserId

personPatient9 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient9 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient9.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-02-17', startTime: '2021-02-17 8:30 AM', endTime: '2021-02-17 8:45 AM', status: true, user_id: userpatient9.id, doctor_id: maximumUserId

person11 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 