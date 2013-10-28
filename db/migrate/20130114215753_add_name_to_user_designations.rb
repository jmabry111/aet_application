class AddNameToUserDesignations < ActiveRecord::Migration
  def change
    add_column :user_designations, :description, :string
  end
end
