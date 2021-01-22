module Pets
  class CreateService < BaseService
    def call
      create_pet
    end

    private

    def create_pet
      begin
        Pets::CreateQuery.call(params: @params)
      rescue ActiveRecord::RecordInvalid => e
        raise e
      end
    end
  end
end