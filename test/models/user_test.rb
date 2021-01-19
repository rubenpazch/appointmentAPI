require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @role = roles(:one)
    @person = people(:one)
    @deparment = departments(:one)
  end

  test 'user with a valid email should be valid' do
    @user = users(:one)
    assert @user.valid?
  end

  test 'user with duplicate email should be invalid' do
    @user1 = User.new(email: 'MyString1@gmail.com',
                      password: 'test99999',
                      password_digest: 'test9999',
                      username: 'testusename',
                      role_id: @role.id,
                      department_id: @deparment.id,
                      person_id: @person.id)

    assert_not @user1.valid?
  end
  test 'user with a invalid email should be invalid' do
    @user2 = User.new(email: 'testtestcom',
                      password_digest: 'test',
                      username: 'testusename',
                      role_id: @role.id,
                      department_id: @deparment.id,
                      person_id: @person.id)

    assert_not @user2.valid?
  end
  test 'user with a duplicate username should be invalid' do
    @user3 = User.new(email: 'uniquenewemail@gmail.com',
                      password_digest: 'test',
                      username: 'MyString1',
                      role_id: @role.id,
                      department_id: @deparment.id,
                      person_id: @person.id)

    assert_not @user3.valid?
  end
end
