ActiveAdmin.register Teacher do
actions :all, except: [:new]
permit_params teaching_assignment_ids: []

index do
  selectable_column
  id_column
  column :user
  column :advisory_block do |ab|
    if ab.advisory_block.present?
    ab.advisory_block.complete_block_name
    else
      'Not yet assigned'
    end
  end
  column "Teachable subjects", :subjects do |subject|
    subject.subjects.map(&:name).join(", ")
  end
  column "Teaching Load", :teaching_assignments do |ta|
    ta.teaching_assignments.map(&:teaching_load_name).join(", ")
  end
  actions
end

form do |f|
  f.inputs do
    f.input :teaching_assignments, collection: SubjectAssignment.where("subject_id" => f.object.subjects.pluck(:id)), member_label: :teaching_load_name
  end
  f.actions
end


end
