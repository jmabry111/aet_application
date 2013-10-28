class AddEmailToTeacherRecommendations < ActiveRecord::Migration
  def change
    add_column :teacher_recommendations, :email, :string
  end
end
