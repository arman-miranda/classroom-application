ActiveAdmin.register Subject do
permit_params :name, :code, block_ids: [], teacher_ids: []

index do
  selectable_column
  id_column
  column :name
  column :code
  column "Blocks" do |block|
    block.blocks.map(&:complete_block_name).join(", ")
  end
 column  :teachers do |teacher|
   teacher.teachers.map(&:teacher_name).join(", ")
 end
  actions
end

form do |f|
  f.inputs do
    f.input :name
    f.input :code
    f.input :blocks, member_label: :complete_block_name 
    f.input :teachers, member_label: :teacher_name
  end
  f.actions
end

end
