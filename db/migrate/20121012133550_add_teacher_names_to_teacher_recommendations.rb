class AddTeacherNamesToTeacherRecommendations < ActiveRecord::Migration
  def change
    add_column :teacher_recommendations, :teacher_name, :string
  end
end
