require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @person = people(:one)
  end

  test 'person with a valid firstName and LastName should be valid' do
    @person1 = Person.new(firstName: 'firstName3',
                          lastName: 'lastName3',
                          documentId: '77778888',
                          phone: '908234723',
                          historyNumber: '223421233')
    assert @person1.valid?
  end

  test 'person with a invalid firstName and LastName should be invalid' do
    @person2 = Person.new(firstName: 'firstname1',
                          lastName: 'lastname1',
                          documentId: '77778888',
                          phone: '908234723',
                          historyNumber: '223421233')
    assert_not @person2.valid?
  end

  test 'person with duplicate documentId should be invalid' do
    @person3 = Person.new(firstName: 'firstname11',
                          lastName: 'lastname11',
                          documentId: '12345678',
                          phone: '908234723',
                          historyNumber: '223421233')
    assert_not @person3.valid?
  end
end
