class AddLastNotifiedAtToTeacherRecommendations < ActiveRecord::Migration
  def change
    add_column :teacher_recommendations, :last_notified_at, :datetime
  end
end
