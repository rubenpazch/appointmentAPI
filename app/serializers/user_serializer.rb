class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :username, :role_id
end
