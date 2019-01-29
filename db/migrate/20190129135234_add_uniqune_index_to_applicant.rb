class AddUniquneIndexToApplicant < ActiveRecord::Migration
  def change
    add_index :applicants, [:last_name, :first_name, :address, :email],
      unique: true,
      name: 'applicant_index'
  end
end
