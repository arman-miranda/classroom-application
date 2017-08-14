ActiveAdmin.register Subject do
permit_params :name, :code, user_ids: [], block_ids: []

index do
  selectable_column
  id_column
  column :name
  column :code
  column "Blocks" do |block|
    block.blocks.map(&:complete_block_name).join(",")
  end
 column "Teachers" do |t|
   t.teachers.map(&:full_name).join(", ")
 end
  actions
end

form do |f|
  f.inputs do
    f.input :name
    f.input :code
    f.input :blocks, as: :select, member_label: :complete_block_name 
  end
  f.actions
end

end
