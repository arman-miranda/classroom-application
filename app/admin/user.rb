ActiveAdmin.register User do
  menu :if => proc{ can? :manage, User} 
  permit_params  :email, :password, :password_confirmation, :first_name, :last_name, :birthdate, :address

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :birthdate
      f.input :address
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
