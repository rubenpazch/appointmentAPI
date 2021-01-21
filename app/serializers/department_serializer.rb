class DepartmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :contactNumber, :code
end
