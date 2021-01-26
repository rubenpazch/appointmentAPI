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
 
department1 = Department.create! name: 'Surgery', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'D'
department2 = Department.create! name: 'Medicine', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'D'
department3 = Department.create! name: 'Cancer Care', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'D'
department4 = Department.create! name: 'Urology', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'D'
department5 = Department.create! name: 'Pediatrics', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'D'
department6 = Department.create! name: 'Laboratory', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'D'
department7 = Department.create! name: 'Emergency', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'D'
department8 = Department.create! name: 'Ophthalmology', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'D'
department9 = Department.create! name: 'Unknow', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'P'
department10 = Department.create! name: 'Administrator', contactNumber: Faker::PhoneNumber.cell_phone_in_e164, location: Faker::Address.street_address, code: 'A'


shift1 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department1.id
shift2 = Shift.create! totalShift: 16, interval: 30,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department2.id
shift3 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department3.id
shift4 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department4.id
shift5 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department5.id
shift6 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department6.id
shift7 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department7.id
shift8 = Shift.create! totalShift: 32, interval: 15,  startDate: '2021-02-01 ', endDate: '2021-02-28 ', department_id: department8.id



# Create Admin Data 1
person = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role1.id, person_id: person.id, department_id: department10.id
# Create Admin Data 2
person = Person.create! firstName: 'administrator', lastName: 'superuser', documentId: '32547698' , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
User.create! email: 'rubenpazchuspe@outlook.com', password: '1234567890', username: 'rpazchuspe', role_id: role1.id, person_id: person.id, department_id: department10.id

  
# Create Doctors data
person1 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userDoctor1 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person1.id, department_id: department1.id
DoctorCalendar.create! startDate: '2021-01-17', endDate: '2021-01-17', startTime: '2021-01-17 08:00 AM', endTime: '2021-01-17 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-18', endDate: '2021-01-18', startTime: '2021-01-18 08:00 AM', endTime: '2021-01-18 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-19', endDate: '2021-01-19', startTime: '2021-01-19 08:00 AM', endTime: '2021-01-19 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-20', endDate: '2021-01-20', startTime: '2021-01-20 08:00 AM', endTime: '2021-01-20 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-21', endDate: '2021-01-21', startTime: '2021-01-21 08:00 AM', endTime: '2021-01-21 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-22', endDate: '2021-01-22', startTime: '2021-01-22 08:00 AM', endTime: '2021-01-22 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-23', endDate: '2021-01-23', startTime: '2021-01-23 08:00 AM', endTime: '2021-01-23 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-24', endDate: '2021-01-24', startTime: '2021-01-24 08:00 AM', endTime: '2021-01-24 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-25', endDate: '2021-01-25', startTime: '2021-01-25 08:00 AM', endTime: '2021-01-25 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-26', endDate: '2021-01-26', startTime: '2021-01-26 08:00 AM', endTime: '2021-01-26 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-27', endDate: '2021-01-27', startTime: '2021-01-27 08:00 AM', endTime: '2021-01-27 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-28', endDate: '2021-01-28', startTime: '2021-01-28 08:00 AM', endTime: '2021-01-28 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-29', endDate: '2021-01-29', startTime: '2021-01-29 08:00 AM', endTime: '2021-01-29 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-30', endDate: '2021-01-30', startTime: '2021-01-30 08:00 AM', endTime: '2021-01-30 16:00 PM', totalHours: 8, user_id: userDoctor1.id, shiftinterval: 15


# Create Doctors data
person11 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userDoctor11 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person11.id, department_id: department1.id
DoctorCalendar.create! startDate: '2021-01-17', endDate: '2021-01-17', startTime: '2021-01-17 16:00 PM', endTime: '2021-01-17 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-18', endDate: '2021-01-18', startTime: '2021-01-18 16:00 PM', endTime: '2021-01-18 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-19', endDate: '2021-01-19', startTime: '2021-01-19 16:00 PM', endTime: '2021-01-19 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-20', endDate: '2021-01-20', startTime: '2021-01-20 16:00 PM', endTime: '2021-01-20 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-21', endDate: '2021-01-21', startTime: '2021-01-21 16:00 PM', endTime: '2021-01-21 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-22', endDate: '2021-01-22', startTime: '2021-01-22 16:00 PM', endTime: '2021-01-22 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-23', endDate: '2021-01-23', startTime: '2021-01-23 16:00 PM', endTime: '2021-01-23 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-24', endDate: '2021-01-24', startTime: '2021-01-24 16:00 PM', endTime: '2021-01-24 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-25', endDate: '2021-01-25', startTime: '2021-01-25 16:00 PM', endTime: '2021-01-25 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-26', endDate: '2021-01-26', startTime: '2021-01-26 16:00 PM', endTime: '2021-01-26 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-27', endDate: '2021-01-27', startTime: '2021-01-27 16:00 PM', endTime: '2021-01-27 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-28', endDate: '2021-01-28', startTime: '2021-01-28 16:00 PM', endTime: '2021-01-28 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-29', endDate: '2021-01-29', startTime: '2021-01-29 16:00 PM', endTime: '2021-01-29 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-30', endDate: '2021-01-30', startTime: '2021-01-30 16:00 PM', endTime: '2021-01-30 24:00 AM', totalHours: 8, user_id: userDoctor11.id, shiftinterval: 30

# Create Doctors data 2
person2 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userDoctor2 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person2.id, department_id: department2.id
DoctorCalendar.create! startDate: '2021-01-17', endDate: '2021-01-17', startTime: '2021-01-17 16:00 PM', endTime: '2021-01-17 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-18', endDate: '2021-01-18', startTime: '2021-01-18 16:00 PM', endTime: '2021-01-18 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-19', endDate: '2021-01-19', startTime: '2021-01-19 16:00 PM', endTime: '2021-01-19 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-20', endDate: '2021-01-20', startTime: '2021-01-20 16:00 PM', endTime: '2021-01-20 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-21', endDate: '2021-01-21', startTime: '2021-01-21 16:00 PM', endTime: '2021-01-21 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-22', endDate: '2021-01-22', startTime: '2021-01-22 16:00 PM', endTime: '2021-01-22 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-23', endDate: '2021-01-23', startTime: '2021-01-23 16:00 PM', endTime: '2021-01-23 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-24', endDate: '2021-01-24', startTime: '2021-01-24 16:00 PM', endTime: '2021-01-24 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-25', endDate: '2021-01-25', startTime: '2021-01-25 16:00 PM', endTime: '2021-01-25 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-26', endDate: '2021-01-26', startTime: '2021-01-26 16:00 PM', endTime: '2021-01-26 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-27', endDate: '2021-01-27', startTime: '2021-01-27 16:00 PM', endTime: '2021-01-27 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-28', endDate: '2021-01-28', startTime: '2021-01-28 16:00 PM', endTime: '2021-01-28 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-29', endDate: '2021-01-29', startTime: '2021-01-29 16:00 PM', endTime: '2021-01-29 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30
DoctorCalendar.create! startDate: '2021-01-30', endDate: '2021-01-30', startTime: '2021-01-30 16:00 PM', endTime: '2021-01-30 24:00 AM', totalHours: 8, user_id: userDoctor2.id, shiftinterval: 30

person22 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userDoctor22 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person22.id, department_id: department2.id
DoctorCalendar.create! startDate: '2021-01-17', endDate: '2021-01-17', startTime: '2021-01-17 16:00 PM', endTime: '2021-01-17 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-18', endDate: '2021-01-18', startTime: '2021-01-18 16:00 PM', endTime: '2021-01-18 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-19', endDate: '2021-01-19', startTime: '2021-01-19 16:00 PM', endTime: '2021-01-19 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-20', endDate: '2021-01-20', startTime: '2021-01-20 16:00 PM', endTime: '2021-01-20 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-21', endDate: '2021-01-21', startTime: '2021-01-21 16:00 PM', endTime: '2021-01-21 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-22', endDate: '2021-01-22', startTime: '2021-01-22 16:00 PM', endTime: '2021-01-22 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-23', endDate: '2021-01-23', startTime: '2021-01-23 16:00 PM', endTime: '2021-01-23 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-24', endDate: '2021-01-24', startTime: '2021-01-24 16:00 PM', endTime: '2021-01-24 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-25', endDate: '2021-01-25', startTime: '2021-01-25 16:00 PM', endTime: '2021-01-25 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-26', endDate: '2021-01-26', startTime: '2021-01-26 16:00 PM', endTime: '2021-01-26 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-27', endDate: '2021-01-27', startTime: '2021-01-27 16:00 PM', endTime: '2021-01-27 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-28', endDate: '2021-01-28', startTime: '2021-01-28 16:00 PM', endTime: '2021-01-28 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-29', endDate: '2021-01-29', startTime: '2021-01-29 16:00 PM', endTime: '2021-01-29 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-30', endDate: '2021-01-30', startTime: '2021-01-30 16:00 PM', endTime: '2021-01-30 24:00 AM', totalHours: 8, user_id: userDoctor22.id, shiftinterval: 15

#Person 3
person3 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userDoctor3 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person3.id, department_id: department3.id
DoctorCalendar.create! startDate: '2021-01-17', endDate: '2021-01-17', startTime: '2021-01-17 08:00 AM', endTime: '2021-01-17 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-18', endDate: '2021-01-18', startTime: '2021-01-18 08:00 AM', endTime: '2021-01-18 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-19', endDate: '2021-01-19', startTime: '2021-01-19 08:00 AM', endTime: '2021-01-19 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-20', endDate: '2021-01-20', startTime: '2021-01-20 08:00 AM', endTime: '2021-01-20 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-21', endDate: '2021-01-21', startTime: '2021-01-21 08:00 AM', endTime: '2021-01-21 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-22', endDate: '2021-01-22', startTime: '2021-01-22 08:00 AM', endTime: '2021-01-22 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-23', endDate: '2021-01-23', startTime: '2021-01-23 08:00 AM', endTime: '2021-01-23 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-24', endDate: '2021-01-24', startTime: '2021-01-24 08:00 AM', endTime: '2021-01-24 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-25', endDate: '2021-01-25', startTime: '2021-01-25 08:00 AM', endTime: '2021-01-25 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-26', endDate: '2021-01-26', startTime: '2021-01-26 08:00 AM', endTime: '2021-01-26 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-27', endDate: '2021-01-27', startTime: '2021-01-27 08:00 AM', endTime: '2021-01-27 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-28', endDate: '2021-01-28', startTime: '2021-01-28 08:00 AM', endTime: '2021-01-28 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-29', endDate: '2021-01-29', startTime: '2021-01-29 08:00 AM', endTime: '2021-01-29 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-30', endDate: '2021-01-30', startTime: '2021-01-30 08:00 AM', endTime: '2021-01-30 16:00 PM', totalHours: 8, user_id: userDoctor3.id, shiftinterval: 15

person33 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userDoctor33 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person33.id, department_id: department3.id
DoctorCalendar.create! startDate: '2021-01-17', endDate: '2021-01-17', startTime: '2021-01-17 16:00 PM', endTime: '2021-01-17 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-18', endDate: '2021-01-18', startTime: '2021-01-18 16:00 PM', endTime: '2021-01-18 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-19', endDate: '2021-01-19', startTime: '2021-01-19 16:00 PM', endTime: '2021-01-19 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-20', endDate: '2021-01-20', startTime: '2021-01-20 16:00 PM', endTime: '2021-01-20 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-21', endDate: '2021-01-21', startTime: '2021-01-21 16:00 PM', endTime: '2021-01-21 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-22', endDate: '2021-01-22', startTime: '2021-01-22 16:00 PM', endTime: '2021-01-22 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-23', endDate: '2021-01-23', startTime: '2021-01-23 16:00 PM', endTime: '2021-01-23 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-24', endDate: '2021-01-24', startTime: '2021-01-24 16:00 PM', endTime: '2021-01-24 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-25', endDate: '2021-01-25', startTime: '2021-01-25 16:00 PM', endTime: '2021-01-25 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-26', endDate: '2021-01-26', startTime: '2021-01-26 16:00 PM', endTime: '2021-01-26 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-27', endDate: '2021-01-27', startTime: '2021-01-27 16:00 PM', endTime: '2021-01-27 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-28', endDate: '2021-01-28', startTime: '2021-01-28 16:00 PM', endTime: '2021-01-28 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-29', endDate: '2021-01-29', startTime: '2021-01-29 16:00 PM', endTime: '2021-01-29 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-30', endDate: '2021-01-30', startTime: '2021-01-30 16:00 PM', endTime: '2021-01-30 24:00 AM', totalHours: 8, user_id: userDoctor33.id, shiftinterval: 15

#Person 4
person4 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userDoctor4 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person4.id, department_id: department4.id
DoctorCalendar.create! startDate: '2021-01-17', endDate: '2021-01-17', startTime: '2021-01-17 08:00 AM', endTime: '2021-01-17 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-18', endDate: '2021-01-18', startTime: '2021-01-18 08:00 AM', endTime: '2021-01-18 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-19', endDate: '2021-01-19', startTime: '2021-01-19 08:00 AM', endTime: '2021-01-19 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-20', endDate: '2021-01-20', startTime: '2021-01-20 08:00 AM', endTime: '2021-01-20 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-21', endDate: '2021-01-21', startTime: '2021-01-21 08:00 AM', endTime: '2021-01-21 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-22', endDate: '2021-01-22', startTime: '2021-01-22 08:00 AM', endTime: '2021-01-22 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-23', endDate: '2021-01-23', startTime: '2021-01-23 08:00 AM', endTime: '2021-01-23 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-24', endDate: '2021-01-24', startTime: '2021-01-24 08:00 AM', endTime: '2021-01-24 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-25', endDate: '2021-01-25', startTime: '2021-01-25 08:00 AM', endTime: '2021-01-25 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-26', endDate: '2021-01-26', startTime: '2021-01-26 08:00 AM', endTime: '2021-01-26 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-27', endDate: '2021-01-27', startTime: '2021-01-27 08:00 AM', endTime: '2021-01-27 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-28', endDate: '2021-01-28', startTime: '2021-01-28 08:00 AM', endTime: '2021-01-28 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-29', endDate: '2021-01-29', startTime: '2021-01-29 08:00 AM', endTime: '2021-01-29 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-30', endDate: '2021-01-30', startTime: '2021-01-30 08:00 AM', endTime: '2021-01-30 16:00 PM', totalHours: 8, user_id: userDoctor4.id, shiftinterval: 15

#Person 5
person5 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userDoctor5 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role2.id, person_id: person5.id, department_id: department5.id
DoctorCalendar.create! startDate: '2021-01-17', endDate: '2021-01-17', startTime: '2021-01-17 08:00 AM', endTime: '2021-01-17 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-18', endDate: '2021-01-18', startTime: '2021-01-18 08:00 AM', endTime: '2021-01-18 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-19', endDate: '2021-01-19', startTime: '2021-01-19 08:00 AM', endTime: '2021-01-19 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-20', endDate: '2021-01-20', startTime: '2021-01-20 08:00 AM', endTime: '2021-01-20 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-21', endDate: '2021-01-21', startTime: '2021-01-21 08:00 AM', endTime: '2021-01-21 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-22', endDate: '2021-01-22', startTime: '2021-01-22 08:00 AM', endTime: '2021-01-22 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-23', endDate: '2021-01-23', startTime: '2021-01-23 08:00 AM', endTime: '2021-01-23 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-24', endDate: '2021-01-24', startTime: '2021-01-24 08:00 AM', endTime: '2021-01-24 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-25', endDate: '2021-01-25', startTime: '2021-01-25 08:00 AM', endTime: '2021-01-25 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-26', endDate: '2021-01-26', startTime: '2021-01-26 08:00 AM', endTime: '2021-01-26 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-27', endDate: '2021-01-27', startTime: '2021-01-27 08:00 AM', endTime: '2021-01-27 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-28', endDate: '2021-01-28', startTime: '2021-01-28 08:00 AM', endTime: '2021-01-28 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-29', endDate: '2021-01-29', startTime: '2021-01-29 08:00 AM', endTime: '2021-01-29 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15
DoctorCalendar.create! startDate: '2021-01-30', endDate: '2021-01-30', startTime: '2021-01-30 08:00 AM', endTime: '2021-01-30 16:00 PM', totalHours: 8, user_id: userDoctor5.id, shiftinterval: 15

# DoctorUsers = User.where(:role_id => role2.id).all
# userDoctor = DoctorUsers.maximum(:id)

# Create Admin Data

# Medicine

personPatient1 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient1 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient1.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:00 AM', endTime: '2021-01-25 8:15 AM', status: true, user_id: userpatient1.id, doctor_id: userDoctor1.id

personPatient2 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient2 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient2.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:15 AM', endTime: '2021-01-25 8:30 AM', status: true, user_id: userpatient2.id, doctor_id: userDoctor1.id

personPatient3 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient3 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient3.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:30 AM', endTime: '2021-01-25 8:45 AM', status: true, user_id: userpatient3.id, doctor_id: userDoctor1.id

personPatient4 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient4 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient4.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:00 AM', endTime: '2021-01-25 8:15 AM', status: true, user_id: userpatient4.id, doctor_id: userDoctor2.id

personPatient5 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient5 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient5.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:15 AM', endTime: '2021-01-25 8:30 AM', status: true, user_id: userpatient5.id, doctor_id: userDoctor2.id

personPatient6 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient6 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient6.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:30 AM', endTime: '2021-01-25 8:45 AM', status: true, user_id: userpatient6.id, doctor_id: userDoctor2.id

personPatient7 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient7 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient7.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:00 AM', endTime: '2021-01-25 8:15 AM', status: true, user_id: userpatient7.id, doctor_id: userDoctor3.id

personPatient8 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient8 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient8.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:15 AM', endTime: '2021-01-25 8:30 AM', status: true, user_id: userpatient8.id, doctor_id: userDoctor3.id

personPatient9 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient9 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient9.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:30 AM', endTime: '2021-01-25 8:45 AM', status: true, user_id: userpatient9.id, doctor_id: userDoctor3.id

personPatient10 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient10 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient10.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:00 AM', endTime: '2021-01-25 8:15 AM', status: true, user_id: userpatient10.id, doctor_id: userDoctor4.id

personPatient11 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient11 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient11.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:15 AM', endTime: '2021-01-25 8:30 AM', status: true, user_id: userpatient11.id, doctor_id: userDoctor4.id

personPatient12 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient12 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient12.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 8:30 AM', endTime: '2021-01-25 8:45 AM', status: true, user_id: userpatient12.id, doctor_id: userDoctor4.id

personPatient13 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient13 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient13.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 9:00 AM', endTime: '2021-01-25 9:15 AM', status: true, user_id: userpatient13.id, doctor_id: userDoctor5.id

personPatient14 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient14 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient14.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 9:15 AM', endTime: '2021-01-25 9:30 AM', status: true, user_id: userpatient14.id, doctor_id: userDoctor5.id

personPatient15 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient15 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient15.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 9:30 AM', endTime: '2021-01-25 9:45 AM', status: true, user_id: userpatient15.id, doctor_id: userDoctor5.id

personPatient16 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient16 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient16.id, department_id: department5.id
Appointment.create! appointmentDate: '2021-01-25', startTime: '2021-01-25 10:00 AM', endTime: '2021-01-25 10:15 AM', status: true, user_id: userpatient16.id, doctor_id: userDoctor5.id




# aditional patients
personPatient17 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient17 = User.create! email: Faker::Internet.email, password: '1234567890', username: Faker::Internet.username, role_id: role3.id, person_id: personPatient17.id, department_id: department5.id

personPatient18 = Person.create! firstName: Faker::Name.first_name, lastName: Faker::Name.last_name, documentId: Faker::IDNumber.chilean_id , phone: Faker::PhoneNumber.cell_phone_in_e164, historyNumber: Faker::IDNumber.valid 
userpatient18 = User.create! email: Faker::Internet.email, password: '1234567890', username: 'khuillca', role_id: role3.id, person_id: personPatient18.id, department_id: department5.id