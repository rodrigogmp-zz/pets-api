class CreateMedicalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_records do |t|
      t.references :pet, foreign_key: true
      t.text :symptoms
      t.text :applied_treatment

      t.timestamps
    end
  end
end
