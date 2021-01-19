class PersonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :firstName, :lastName, :documentId, :phone, :historyNumber
end
