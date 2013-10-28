class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :school
      t.integer :grade
      t.string :gender
      t.string :parent_first_name
      t.string :parent_last_name
      t.string :address
      t.string :home_phone
      t.string :work_phone
      t.string :email
      t.string :math_teacher
      t.string :science_teacher
      t.string :english_teacher

      t.timestamps
    end
  end
end
