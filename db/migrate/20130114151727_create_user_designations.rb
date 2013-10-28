class CreateUserDesignations < ActiveRecord::Migration
  def change
    create_table :user_designations do |t|

      t.timestamps
    end
  end
end
