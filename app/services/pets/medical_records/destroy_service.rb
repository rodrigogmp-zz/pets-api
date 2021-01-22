module Pets
  module MedicalRecords
    class DestroyService < BaseService
      def call
        destroy_medical_record_by_id
      end

      private

      def destroy_medical_record_by_id
        Pets::MedicalRecords::DestroyQuery.call(params: @params)
      end
    end
  end
end