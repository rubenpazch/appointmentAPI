require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'user with a valid email should be valid' do
    role = Role.first
    person = Person.create! fistName: Faker::Name.first_name,
                            lastName: Faker::Name.last_name,
                            documentId: Faker::IDNumber.chilean_id,
                            phone: Faker::PhoneNumber.cell_phone_in_e164,
                            historyNumber: Faker::IDNumber.valid
    deparment = Department.create! name: 'Surgery', contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                   location: Faker::Address.street_address
    user = User.new(email: 'test@test.com', password_digest: 'test', username: 'testusename', role_id: role.id,
                    department_id: deparment.id, person_id: person.id)
    assert user.valid?
  end
  test 'user with duplicate email should be invalid' do
    role = Role.first
    person = Person.create! fistName: Faker::Name.first_name,
                            lastName: Faker::Name.last_name,
                            documentId: Faker::IDNumber.chilean_id,
                            phone: Faker::PhoneNumber.cell_phone_in_e164,
                            historyNumber: Faker::IDNumber.valid
    deparment = Department.create! name: 'Surgery',
                                   contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                   location: Faker::Address.street_address
    user = User.new(email: 'MyString1@gmail.com', password_digest: 'test', username: 'testusename', role_id: role.id,
                    department_id: deparment.id, person_id: person.id)
    assert_not user.valid?
  end
  test 'user with a invalid email should be invalid' do
    role = Role.first
    person = Person.create! fistName: Faker::Name.first_name,
                            lastName: Faker::Name.last_name,
                            documentId: Faker::IDNumber.chilean_id,
                            phone: Faker::PhoneNumber.cell_phone_in_e164,
                            historyNumber: Faker::IDNumber.valid
    deparment = Department.create! name: 'Surgery', contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                   location: Faker::Address.street_address
    user = User.new(email: 'testtestcom', password_digest: 'test', username: 'testusename', role_id: role.id,
                    department_id: deparment.id, person_id: person.id)
    assert_not user.valid?
  end
end
