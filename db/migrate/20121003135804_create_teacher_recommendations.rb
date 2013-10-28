class CreateTeacherRecommendations < ActiveRecord::Migration
  def change
    create_table :teacher_recommendations do |t|
      t.integer :desire
      t.integer :aptitude
      t.integer :persistence
      t.integer :self_discipline
      t.integer :interaction
      t.integer :problem_solving
      t.integer :inquiry_skills
      t.integer :study_skills
      t.integer :time_management
      t.integer :teamwork
      t.integer :dedication
      t.integer :work_ethic
      t.integer :recommendation
      t.string :subject
      t.date :date_submitted

      t.timestamps
    end
  end
end
