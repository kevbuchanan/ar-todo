require_relative ('../views/task_view.rb')
require_relative ('../views/list_view.rb')

class ListController
  
  def list(list_name)
    list = find_list(list_name)
    puts "--#{list_name}--"
    TaskView.show(list.tasks)
  end

  def add(list_name, task_name)
    list = find_list(list_name)
    list.add_task(task_name)
    list(list_name)
  end

  def delete(list_name, task_number)
    list = find_list(list_name)
    task = list.tasks[task_number - 1]
    task.destroy
    list(list_name)
  end

  def complete(list_name, task_number)
    list = find_list(list_name)
    task = list.tasks[task_number - 1]
    task.complete
    list(list_name)
  end

  def find_list(list_name)
    List.where("name = ?", list_name).first
  end

  def show_all
    list_names = List.all.map(&:name)
    ListView.show(list_names)
  end

  def create_list(name)
    List.create(name: name)
    show_all
  end

  def tag_task(list_name, task_number, tag_name)
    list = find_list(list_name)
    task = list.tasks[task_number - 1]
    task.tag(tag_name)
    list(list_name)
  end
end
