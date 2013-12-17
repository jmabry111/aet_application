class AddFieldsToTeacherRecommendations < ActiveRecord::Migration
  def change
    add_column :teacher_recommendations, :self_starter, :integer, default: 0
    add_column :teacher_recommendations, :written_work, :integer, default: 0
  end
end
