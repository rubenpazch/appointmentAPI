class DepartmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :contactNumber, :code
  has_many :doctors, class_name: 'User'
end
