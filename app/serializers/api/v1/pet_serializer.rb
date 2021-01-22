class Api::V1::PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :kind, :birthday_date, :created_at,
             :updated_at, :medical_records, :medical_records_ids

  def medical_records
    return if @instance_options[:action] == :index

    object.medical_records
  end

  def medical_records_ids
    return unless @instance_options[:action] == :index

    object.medical_records.pluck(:id)
  end
end