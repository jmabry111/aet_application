class AddTeacherContactedToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :teacher_contacted, :boolean
  end
end
