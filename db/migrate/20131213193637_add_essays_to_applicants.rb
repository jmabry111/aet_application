class AddEssaysToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :engineering_essay, :text
    add_column :applicants, :interests_essay, :text
  end
end
