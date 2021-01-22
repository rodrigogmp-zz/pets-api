module Csvs
  class CreateService < BaseService
    def call
      create_csv
    end

    private

    def create_csv
      medical_records = MedicalRecord
                        .filter(
                          by_applied_treatment: @params[:medicine]
                        )
                        .joins(:pet)
                        .where(pets: { birthday_date: @params[:birthday_date] })
                        .includes(:pet)

      formatted_medical_records = []

      medical_records.each do |mr|
        formatted_medical_records << {
          pet: {
            id: mr.pet.id,
            name: mr.pet.name,
            breed: mr.pet.breed,
            kind: mr.pet.kind
          },
          symptoms: mr.symptoms,
          applied_treatment: mr.applied_treatment
        }
      end

      headers = ['Pet Name', 'Pet Breed', 'Pet Kind', 'Symptoms', 'Applied Treatment']

      csv = CSV.generate(write_headers: true, headers: headers) do |writer|
        formatted_medical_records.each do |record|
          writer << [record[:pet][:name], record[:pet][:breed], record[:pet][:kind], record[:symptoms], record[:applied_treatment]]
        end

        writer << ['Medicine', @params[:medicine]]
        writer << ['Birthday Date', @params[:birthday_date]]
      end
    end
  end
end