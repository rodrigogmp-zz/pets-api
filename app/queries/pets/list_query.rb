module Pets
  class ListQuery < BaseQuery

    def call
      query_pets
    end

    private

    def query_pets
      Pet
        .filter(
          by_name: @params[:name],
          by_breed: @params[:breed],
          by_kind: @params[:kind]
        )
        .includes(:medical_records)
        .paginate(page: @params[:page], per_page: @params[:per_page])
    end
  end
end