class AddTeacherEmailsToApplicants < ActiveRecord::Migration
  def change
    add_column    :applicants, :math_teacher_email, :string
    add_column    :applicants, :science_teacher_email, :string
    add_column    :applicants, :english_teacher_email, :string
  end
end
