require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @role = Role.first

    @person = Person.create! firstName: Faker::Name.first_name,
                             lastName: Faker::Name.last_name,
                             documentId: Faker::IDNumber.chilean_id,
                             phone: Faker::PhoneNumber.cell_phone_in_e164,
                             historyNumber: Faker::IDNumber.valid

    @deparment = Department.create! name: 'Surgery',
                                    contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                    location: Faker::Address.street_address
  end

  test 'user with a valid email should be valid' do
    puts @person.firstName
    @user = User.new(email: 'test@test.com',
                     password: 'test',
                     password_digest: 'test',
                     username: 'testusename',
                     role_id: @role.id,
                     department_id: @deparment.id,
                     person_id: @person.id)

    assert @user.valid?
  end

  #test 'user with duplicate email should be invalid' do
    #  @user1 = User.new( email: 'MyString1@gmail.com',
    #                     password: 'test',
    #                     password_digest: 'test',
    #                     username: 'testusename',
    #                     role_id: @role.id,
    #                     department_id: @deparment.id,
    #                     person_id: @person.id )
    #
    #  assert_not @user1.valid?
    #
  #end
  # test 'user with a invalid email should be invalid' do
  #  role = Role.first
  #  person = Person.create! firstName: Faker::Name.first_name,
  #                          lastName: Faker::Name.last_name,
  #                          documentId: Faker::IDNumber.chilean_id,
  #                          phone: Faker::PhoneNumber.cell_phone_in_e164,
  #                          historyNumber: Faker::IDNumber.valid
  #  deparment = Department.create! name: 'Surgery', contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
  #                                 location: Faker::Address.street_address
  #  user = User.new(email: 'testtestcom', password_digest: 'test', username: 'testusename', role_id: role.id,
  #                  department_id: deparment.id, person_id: person.id)
  #  assert_not user.valid?
  # end
end
