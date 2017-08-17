ActiveAdmin.register User, as: "All Users" do
  menu :if => proc{ can? :manage, User} 

  permit_params  :email, :password, :password_confirmation, :first_name, :last_name, :confirmed_at, :birthdate, :address, role_ids: [] 

  controller do
    def update
      #Removes Devise dependency on password to make changes
      if (params[:user][:password] && params[:user][:password_confirmation]).blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end

      super
    end
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :roles do |role|
      role.roles.map(&:name).join(", ")
    end
    column :confirmed_at
    actions
  end

  filter :email
  filter :confirmed_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :birthdate
      f.input :address
      f.input :roles, input_html: {multiple: false }
      f.input :password
      f.input :password_confirmation
      f.input :confirmed_at, label: "Confirm user details?", as: :boolean, checked_value: Time.now, unchecked_value: ""
    end
    f.actions
  end

end
