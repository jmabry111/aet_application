class AddIdsToUserDesignations < ActiveRecord::Migration
  def change
    add_column :user_designations, :school_id, :integer
    add_column :user_designations, :user_id, :integer
    
    add_column :schools, :user_designation_id, :integer
    
    add_column :users, :user_designation_id, :integer
  end
end
