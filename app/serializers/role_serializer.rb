class RoleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :code
end
