class AddTestScoresToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :psat_english, :integer
    add_column :applicants, :psat_math, :integer
    add_column :applicants, :vpt_english, :integer
    add_column :applicants, :vpt_math, :integer
    add_column :applicants, :essay1_score, :integer
    add_column :applicants, :essay2_score, :integer
  end
end
