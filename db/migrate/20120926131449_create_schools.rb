class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :representative_email

      t.timestamps
      
      remove_column :applicants, :school
      add_column :applicants, :school_id, :integer
    end
  end
end
