module Pets
  class FindQuery < BaseQuery

    def call
      find_pet_by_id
    end

    private

    def find_pet_by_id
      Pet.find(@params)
    end
  end
end