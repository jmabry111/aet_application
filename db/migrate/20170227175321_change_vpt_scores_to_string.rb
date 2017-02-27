class ChangeVptScoresToString < ActiveRecord::Migration
  def change
    change_column :applicants, :vpt_math, :string
    change_column :applicants, :vpt_english, :string
  end
end
