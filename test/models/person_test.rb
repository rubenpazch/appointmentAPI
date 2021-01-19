require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @person = Person.new(firstName: Faker::Name.first_name,
                         lastName: Faker::Name.last_name,
                         documentId: Faker::IDNumber.chilean_id,
                         phone: Faker::PhoneNumber.cell_phone_in_e164,
                         historyNumber: Faker::IDNumber.valid)
  end
  # test 'person with a valid firstName and LastName should be valid' do
  #   assert @person.valid?
  # end
end
