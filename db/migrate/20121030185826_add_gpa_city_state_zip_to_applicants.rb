class AddGpaCityStateZipToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :city, :string
    add_column :applicants, :state, :string
    add_column :applicants, :zip, :string
    add_column :applicants, :gpa, :float
    add_column :applicants, :applicant_email, :string
  end
end
