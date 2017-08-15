ActiveAdmin.register Block do
permit_params :name, :year_level, :teacher_id

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
    actions
  end

  form do |f|
    f.inputs do
      f.input :year_level, as: :select, collection: (1..4)
      f.input :name
      f.input :advisory_teacher, as: :select,  collection: User.with_role(:teacher)
    end
    f.actions
  end

end
