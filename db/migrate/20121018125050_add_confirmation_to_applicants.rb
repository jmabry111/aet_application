class AddConfirmationToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :applicant_confirmation, :boolean
    add_column :applicants, :parent_confirmation, :boolean
  end
end
