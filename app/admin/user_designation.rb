ActiveAdmin.register UserDesignation do
  index do
    column :school
    column :user
  end
  form do |f|
    f.inputs "User Designation Details" do
      f.input :school
      f.input :user
    end
    f.actions
  end
end
