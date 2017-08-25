class SubjectGrade < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  has_many   :grades, dependent: :destroy
end
