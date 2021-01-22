module Pets
  module MedicalRecords
    class ListService < BaseService
      def call
        query_medical_records_by_pet
      end

      private

      def query_medical_records_by_pet
        Pets::MedicalRecords::ListQuery.call(params: @params)
      end
    end
  end
end