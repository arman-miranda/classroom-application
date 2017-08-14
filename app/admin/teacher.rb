ActiveAdmin.register User, as: "Teachers" do
  permit_params  :email, :password, :password_confirmation, :first_name, :last_name, :birthdate, :address, subject_ids: [], block_ids: []

  controller do
    def scoped_collection
      User.with_role :teacher
    end
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :subjects do |subject|
      subject.subjects.map(&:name).join(", ")
    end
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
      f.input :subjects, input_html: { multiple: false }
      f.input :blocks, collection: f.object.subjects.first.blocks
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
