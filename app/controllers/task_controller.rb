require_relative ('../views/task_view.rb')

class TaskController
  def list_outstanding
    tasks = Task.where("status = ?", "not complete").order("created_at")
    TaskView.show(tasks.to_a)
  end

  def list_completed
    tasks = Task.where("status = ?", "complete").order("updated_at")
    TaskView.show(tasks.to_a)
  end
end
  
