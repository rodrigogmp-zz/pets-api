module Pets
  module MedicalRecords
    class ListQuery < BaseQuery
      def call
        query_medical_records_by_pet
      end

      private
      
      def query_medical_records_by_pet
        MedicalRecord
        .filter(
          by_symptoms: @params[:symptoms],
          by_applied_treatment: @params[:applied_treatment]
        )
        .where(pet_id: @params[:pet_id])
        .paginate(page: @params[:page], per_page: @params[:per_page])
      end
    end
  end
end