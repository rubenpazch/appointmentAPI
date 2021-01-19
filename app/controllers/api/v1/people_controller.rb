class Api::V1::PeopleController < ApplicationController
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: PersonSerializer.new(@person).serializable_hash, status: :created
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  private

  def person_params
    params.require(:person).permit(
      :firstName,
      :lastName,
      :documentId,
      :phone,
      :historyNumber,
    )
  end
end
