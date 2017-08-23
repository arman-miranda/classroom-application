class AddAttachmentAttachmentToSubjectAssignments < ActiveRecord::Migration
  def self.up
    change_table :subject_assignments do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :subject_assignments, :attachment
  end
end
