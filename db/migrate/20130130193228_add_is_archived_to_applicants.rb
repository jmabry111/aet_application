class AddIsArchivedToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :is_archived, :boolean, default: false
  end
end
