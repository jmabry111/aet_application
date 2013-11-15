class AddNewFieldsToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :ethnicity, :string
    add_column :applicants, :student_texts_ok?, :boolean, default: :false
    add_column :applicants, :parent_texts_ok?, :boolean, default: :false
    add_column :applicants, :after_graduation_plans, :string
    add_column :applicants, :degree_plans, :string
    add_column :applicants, :track, :string
    add_column :applicants, :additional_academic_information, :string
    add_column :applicants, :extra_curricular_activities, :string
  end
end
