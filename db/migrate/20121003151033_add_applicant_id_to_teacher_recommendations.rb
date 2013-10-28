class AddApplicantIdToTeacherRecommendations < ActiveRecord::Migration
  def change
    add_column :teacher_recommendations, :applicant_id, :integer
  end
end
