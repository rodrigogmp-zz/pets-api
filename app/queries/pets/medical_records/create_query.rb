module Pets
  module MedicalRecords
    class CreateQuery < BaseQuery
      def call
        @pet = @params[:pet]

        create_medical_record
      end

      private
      
      def create_medical_record
        begin
          @pet.medical_records.create!(@params.except(:pet))
        rescue ActiveRecord::RecordInvalid => e
          raise e
        end
      end
    end
  end
end