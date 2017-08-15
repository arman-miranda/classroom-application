ActiveAdmin.register Teacher do
actions :all, except: [:new]

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


end
