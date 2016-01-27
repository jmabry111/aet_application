ActiveAdmin.register UserDesignation do
  permit_params :school_id, :user_id, :description
  index do
    selectable_column
    column :school
    column :user
    column :description
    actions
  end
  form do |f|
    f.inputs "User Designation Details" do
      f.input :school
      f.input :user
      f.input :description
    end
    f.actions
  end
end
