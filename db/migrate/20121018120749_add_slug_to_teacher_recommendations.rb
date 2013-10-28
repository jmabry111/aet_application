class AddSlugToTeacherRecommendations < ActiveRecord::Migration
  def change
    add_column :teacher_recommendations, :slug, :string
    add_index(:teacher_recommendations, :slug, :unique => true)
  end
end
