ActiveAdmin.register Subject do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :code, user_ids: [], block_ids: []
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
  column :name
  column :code
  column "Blocks" do |block|
    block.blocks.map(&:complete_block_name).join(",")
  end
 #column "Teachers" do |t|
 #  t.teachers.map(&:full_name).join(", ")
 #end
  actions
end

form do |f|
  f.inputs do
    f.input :name
    f.input :code
    f.input :blocks, as: :select, member_label: :complete_block_name 
   #f.input :users, label: "Teachers", as: :select, input_html: { multiple: true }, collection: User.with_role(:teacher) 
  end
  f.actions
end

end
