class Api::V1::MedicalRecordSerializer < ActiveModel::Serializer
  attributes :id, :symptoms, :applied_treatment, :created_at,
             :updated_at, :pet_id
end