require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test 'role with a valid name should be valid' do
    role = Role.new(name: 'patient', code: 'A')
    assert role.valid?
  end
  test 'role with a invalid name should be invalid' do
    role = Role.new(name: '', code: 'A')
    assert_not role.valid?
  end
end
