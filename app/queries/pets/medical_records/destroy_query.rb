module Pets
  module MedicalRecords
    class DestroyQuery < BaseQuery
      def call
        destroy_medical_record_by_id
      end

      private
      
      def destroy_medical_record_by_id
        MedicalRecord.destroy(@params)
      end
    end
  end
end