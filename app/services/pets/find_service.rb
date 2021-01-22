module Pets
  class FindService < BaseService
    def call
      find_pet_by_id
    end

    private

    def find_pet_by_id
      begin
        Pets::FindQuery.call(params: @params)
      rescue ActiveRecord::RecordInvalid => e
        raise e
      end
    end
  end
end