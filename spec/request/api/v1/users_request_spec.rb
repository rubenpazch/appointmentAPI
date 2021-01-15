require 'rails_helper'

describe 'Users API', type: :request do
  describe 'GET /users' do
    it 'returns user by id' do
      role = Role.create(name: 'patient')

      person = Person.create! fistName: Faker::Name.first_name,
                              lastName: Faker::Name.last_name,
                              documentId: Faker::IDNumber.chilean_id,
                              phone: Faker::PhoneNumber.cell_phone_in_e164,
                              historyNumber: Faker::IDNumber.valid

      department = Department.create! name: 'Surgery',
                                      contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                      location: Faker::Address.street_address

      User.create(email: 'test@test.com',
                  password_digest: 'test',
                  username: 'testusename',
                  role_id: role.id,
                  department_id: department.id,
                  person_id: person.id)

      user = User.first

      get "/api/v1/users/#{user.id}"

      expect(response).to have_http_status(:forbidden)
    end

    it 'returns user by id' do
      role = Role.create(name: 'patient')

      person = Person.create! fistName: Faker::Name.first_name,
                              lastName: Faker::Name.last_name,
                              documentId: Faker::IDNumber.chilean_id,
                              phone: Faker::PhoneNumber.cell_phone_in_e164,
                              historyNumber: Faker::IDNumber.valid

      department = Department.create! name: 'Surgery',
                                      contactNumber: Faker::PhoneNumber.cell_phone_in_e164,
                                      location: Faker::Address.street_address

      user = User.create(email: 'test@test.com',
                  password_digest: 'test',
                  username: 'testusename',
                  role_id: role.id,
                  department_id: department.id,
                  person_id: person.id)

      get "/api/v1/users/#{user.id}", headers: {
                                         Authorization: JsonWebToken.encode(user_id: user.id)
                                      }

      expect(response).to have_http_status(:success)
    end
    #
    #    it 'returns error if user not exists' do
    #      get '/api/v1/users/100'
    #      expect(response).to have_http_status(:no_content)
    #    end
    #
    #    it 'returns user size' do
    #      role = Role.create(name: 'patient')
    #
    #      @user = FactoryBot.create(:user,
    #                                email: 'test9999@test.com',
    #                                password_digest: 'test9999',
    #                                username: 'test9999',
    #                                role_id: role.id)
    #
    #      FactoryBot.create(:user,
    #                        email: 'test8888@test.com',
    #                        password_digest: 'test8888',
    #                        username: 'test8888',
    #                        role_id: role.id)
    #
    #      get '/api/v1/users'
    #
    #      expect(response).to have_http_status(:success)
    #      expect(JSON.parse(response.body).size).to eq(2)
    #    end
  end
  #
  #  describe 'POST /users' do
  #    it 'should create a new user' do
  #      role = Role.create(name: 'admin')
  #      expect {
  #        post '/api/v1/users',
  #             params: {
  #               user: {
  #                 email: 'test7777@test.com',
  #                 password: 'test7777',
  #                 password_digest: 'test7777',
  #                 username: 'test7777',
  #                 role_id: role.id
  #               }
  #             }
  #      }.to change { User.count }.from(0).to(1)
  #      expect(response).to have_http_status(:created)
  #    end
  #    it 'should not create a new user with taken email' do
  #      role = Role.create(name: 'admin')
  #
  #      FactoryBot.create(:user, email: 'test7777@test.com', password_digest: 'test7777', username: 'testXXXX',
  #                               role_id: role.id)
  #
  #      post '/api/v1/users',
  #           params: {
  #             user: {
  #               email: 'test7777@test.com',
  #               password: 'test7777',
  #               password_digest: 'test7777',
  #               username: 'test7777',
  #               role_id: role.id
  #             }
  #           }
  #      expect(response).to have_http_status(:unprocessable_entity)
  #    end
  #
  #    it 'should not create a new user with taken username' do
  #      role = Role.create(name: 'admin')
  #
  #      FactoryBot.create(:user, email: 'test7777@test.com', password_digest: 'test7777', username: 'rpaz',
  #                               role_id: role.id)
  #
  #      post '/api/v1/users',
  #           params: {
  #             user: {
  #               email: 'testXXXX@test.com',
  #               password: 'test7777',
  #               password_digest: 'test7777',
  #               username: 'rpaz',
  #               role_id: role.id
  #             }
  #           }
  #      expect(response).to have_http_status(:unprocessable_entity)
  #    end
  #  end
  #
  #  describe 'PATCH /users/id' do
  #    it 'should not update a existing user without token' do
  #      role = Role.create(name: 'admin')
  #
  #      FactoryBot.create(:user, email: 'raul@gmail.com', password_digest: '1234567890', username: 'raul',
  #                               role_id: role.id)
  #
  #      user = User.first
  #
  #      patch "/api/v1/users/#{user.id}",
  #            params: {
  #              user: {
  #                email: 'pedro@test.com',
  #                password: 'test7777',
  #                password_digest: 'test7777',
  #                username: 'pedro',
  #                role_id: role.id
  #              }
  #            }
  #      expect(response).to have_http_status(:forbidden)
  #    end
  #
  #    it 'should update a existing user with token' do
  #      role = Role.create(name: 'admin')
  #
  #      FactoryBot.create(:user, email: 'raul@gmail.com', password_digest: '1234567890', username: 'raul',
  #                               role_id: role.id)
  #
  #      user = User.first
  #      puts user.id
  #
  #      patch "/api/v1/users/#{user.id}",
  #            params: {
  #              user: {
  #                email: 'pedro@test.com',
  #                password: 'test7777',
  #                password_digest: 'test7777',
  #                username: 'pedro',
  #                role_id: role.id
  #              }
  #            },
  #            headers: {
  #              Authorization: JsonWebToken.encode(user_id: user.id)
  #            }
  #      expect(response).to have_http_status(:success)
  #    end
  #  end
  #
  #  describe 'DELETE /users/id' do
  #    it 'should not delete a user without token' do
  #      role = Role.create(name: 'admin')
  #
  #      FactoryBot.create(:user, email: 'raul@gmail.com', password_digest: '1234567890', username: 'raul',
  #                               role_id: role.id)
  #
  #      user = User.first
  #
  #      delete "/api/v1/users/#{user.id}"
  #      expect(response).to have_http_status(:forbidden)
  #    end
  #
  #    it 'should delete a user with token' do
  #      role = Role.create(name: 'admin')
  #
  #      FactoryBot.create(:user, email: 'raul@gmail.com', password_digest: '1234567890', username: 'raul',
  #                               role_id: role.id)
  #
  #      user = User.first
  #
  #      delete "/api/v1/users/#{user.id}",
  #             headers: {
  #               Authorization: JsonWebToken.encode(user_id: user.id)
  #             }
  #
  #      expect(response).to have_http_status(:no_content)
  #    end
  #  end
end
