class ChangeAdditionalInfoToText < ActiveRecord::Migration
  def up
    change_column :applicants, :additional_academic_info, :text
  end

  def down
    change_column :applicants, :additional_academic_info, :string
    
  end
end
