ActiveAdmin.register Block do
permit_params :name, :year_level, :teacher_id, subject_ids: []

  index do
    selectable_column
    id_column
    column :year_level
    column :name
    column :advisory_teacher do |teacher|
      if teacher.advisory_teacher.present? 
      teacher.advisory_teacher.teacher_name
      else
        'Not yet assigned'
      end
    end
    column :subjects do |subject| 
      subject.subjects.map(&:name).join(", ")
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :year_level, as: :select, collection: (1..4)
      f.input :name
      f.input :advisory_teacher,  collection: Teacher.all, member_label: :teacher_name
    end
    f.actions
  end

end
