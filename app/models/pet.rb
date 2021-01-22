class Pet < ApplicationRecord
  has_many :medical_records
  validates_presence_of :name, :breed, :kind, :birthday_date

  accepts_nested_attributes_for :medical_records

  enum kind: { dog: 0, cat: 1 }

  scope :by_name, -> (name) {
		where('name like ?', "%#{name}%")
  }

  scope :by_breed, -> (breed) {
		where('breed like ?', "%#{breed}%")
  }

  scope :by_kind, -> (kind) {
		where(kind: kind.to_sym)
  }
end
