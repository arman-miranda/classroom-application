ActiveAdmin.register Block do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :year_level, :user_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    id_column
    column :year_level
    column :name
    column :advisory_teacher
    actions
  end

  form do |f|
    f.inputs do
      f.input :year_level, as: :select, collection: (1..4)
      f.input :name
      f.input :advisory_teacher, collection: User.with_role(:teacher)
    end
    f.actions
  end

end
