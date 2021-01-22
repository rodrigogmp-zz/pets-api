class Api::V1::PetsController < BaseController
  before_action :set_pet, only: :show

  def show
    render json:
            Pets::FindService.call(params: params[:id]),
            each_serializer: Api::V1::PetSerializer,
            action: :show
  end

  def index
    params[:page] ||= 1
    params[:per_page] ||= 10

    render json: 
            Pets::ListService.call(params: params), 
            each_serializer: Api::V1::PetSerializer,
            action: :index
  end

  def create
    render json: 
            Pets::CreateService.call(params: pet_params), 
            serializer: Api::V1::PetSerializer,
            action: :create
  end

  private

  def set_pet
    @pet = Pets::FindService.call(params: params[:id])
  end

  def pet_params
    require_parameters(parameters: [:name, :breed, :kind, :birthday_date])

    params.permit(:name, :breed, :kind, :birthday_date, medical_records_attributes: [:symptoms, :applied_treatment])
  end
end
