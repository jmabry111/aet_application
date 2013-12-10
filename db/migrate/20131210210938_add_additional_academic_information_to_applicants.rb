class AddAdditionalAcademicInformationToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :additional_academic_info, :string
  end
end
