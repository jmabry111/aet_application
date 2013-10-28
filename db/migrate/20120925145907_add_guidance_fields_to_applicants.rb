class AddGuidanceFieldsToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :school_phone, :string
    add_column :applicants, :counselor_name, :string
    add_column :applicants, :due_to, :string
    add_column :applicants, :date_due, :date
  end
end
