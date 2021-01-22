module Pets
  class ListService < BaseService
    def call
      query_pets
    end

    private

    def query_pets
      Pets::ListQuery.call(params: @params)
    end
  end
end