class Task < ActiveRecord::Base
  belongs_to :list
  has_many :tasks_tags
  has_many :tags, through: :tasks_tags

  def complete
    self.update_attribute(:status , "complete")  
  end

  def tag(tag_name)
    TasksTag.create(task_id: self.id, tag_id: Tag.find_or_create_by_name(name: tag_name).id)
  end
end
