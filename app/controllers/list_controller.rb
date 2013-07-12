class ListController
  def display(tasks)
    tasks.each_with_index do |task , index|
      print "#{index + 1}. "
      print task.description
       print " X" if task.status == "complete"
       print "\n"
    end
  end
  
  def list(list_name)
    list = find_list(list_name)
    display(list.tasks)
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
end
