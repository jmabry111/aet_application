ActiveAdmin.register User do
  permit_params :email, :current_sign_in_at, :last_sign_in_at, :sign_in_count, :name
    index do
      selectable_column
      column :email
      column :current_sign_in_at
      column :last_sign_in_at
      column :sign_in_count
      column :admin
      actions
  end
  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
#      f.input :school
    end
    f.actions
  end
end
