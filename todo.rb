require_relative 'config/application'
require_relative 'app/controllers/list_controller.rb'
require_relative 'app/controllers/task_controller.rb'
require_relative 'app/controllers/tag_controller.rb'

def help
  puts "list 'list name' => shows list tasks"
  puts "delete 'list name' task number => deletes task"
  puts "complete 'list name' task number => marks task complete"
  puts "add 'list name' task description => adds task to list"
  puts "show_lists => shows all lists"
  puts "add_list 'list name' => creates a new list"
  puts "list:outstanding => lists outstanding tasks sorted by creation date"
  puts "list:completed => lists completed tasks sorted by completion date"
  puts "tag 'list name' task number 'tag name' => tags task"
  puts "filter 'tag name' => lists tasks tagged with tag name"
end

list_controller = ListController.new
task_controller = TaskController.new
tag_controller = TagController.new
command = ARGV.shift
arguments = ARGV
case command
when 'list'
  list_controller.list(arguments[0])
when 'delete'
  list_controller.delete(arguments[0], arguments[1].to_i)
when 'complete'
  list_controller.complete(arguments[0], arguments[1].to_i)
when 'add'
  list_controller.add(arguments[0], arguments[1])
when 'show_lists'
  list_controller.show_all
when 'add_list'
  list_controller.create_list(arguments[0])
when 'list:outstanding'
  task_controller.list_outstanding
when 'list:completed'
  task_controller.list_completed
when 'tag'
  list_controller.tag_task(arguments[0], arguments[1].to_i, arguments[2])
when 'filter'
  tag_controller.list_tasks(arguments[0])
when '--help'
  help
else
  puts 'invalid command'
end

