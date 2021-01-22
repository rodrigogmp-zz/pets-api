class Api::V1::MedicalRecordsController < BaseController
  before_action :set_pet
  before_action :set_medical_record, only: [:show, :destroy]

  def create
    @medical_record = 
      Pets::MedicalRecords::CreateQuery.call(
        params: medical_record_params.merge(pet: @pet)
      )

    render json: @medical_record, serializer: Api::V1::MedicalRecordSerializer
  end

  def index
    params[:page] ||= 1
    params[:per_page] ||= 10

    @medical_records = Pets::MedicalRecords::ListService.call(params: params.merge(pet_id: @pet.id))
    
    render json: @medical_records, each_serializer: Api::V1::MedicalRecordSerializer
  end

  def destroy
    Pets::MedicalRecords::DestroyService.call(params: @medical_record.id)
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_medical_record
    @medical_record = @pet.medical_records.find(params[:id])
  end

  def medical_record_params
    require_parameters(parameters: [:symptoms, :applied_treatment])

    params.permit(:symptoms, :applied_treatment)
  end
end
