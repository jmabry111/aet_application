ActiveAdmin.register User do
    index do
      column :email
      column :current_sign_in_at
      column :last_sign_in_at
      column :sign_in_count
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
