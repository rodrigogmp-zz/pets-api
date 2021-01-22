module Pets
  class CreateQuery < BaseQuery
    def call
      create_pet
    end

    private

    def create_pet
      begin
        Pet.create!(@params)
      rescue ActiveRecord::RecordInvalid => e
        raise e
      end
    end
  end
end