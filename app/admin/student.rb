ActiveAdmin.register Student do
permit_params :user_id, block_ids: [], subject_ids: []

index do
  selectable_column
  id_column
  column :user
  column :blocks do |block|
    block.blocks.map(&:complete_block_name).join(",")
  end
  column :subjects do |subject|
    subject.subjects.map(&:name).join(", ")
  end
  actions
end

form do |f|
  f.inputs do
    f.input :blocks, member_label: :complete_block_name
    f.actions
  end
end
end
