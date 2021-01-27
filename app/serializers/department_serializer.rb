class DepartmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :contactNumber, :code, :location
  has_many :doctors, class_name: 'User'
end
