class MedicalRecord < ApplicationRecord
  belongs_to :pet
  validates_presence_of :pet, :symptoms, :applied_treatment

  scope :by_symptoms, -> (symptoms) {
		where('symptoms like ?', "%#{symptoms}%")
  }

  scope :by_applied_treatment, -> (applied_treatment) {
		where('applied_treatment like ?', "%#{applied_treatment}%")
  }
end
