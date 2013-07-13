require_relative ('../views/task_view.rb')

class TagController
  def list_tasks(tag_name)
    tag = Tag.where("name = ?", tag_name).first
    TaskView.show(tag.tasks)
  end
end