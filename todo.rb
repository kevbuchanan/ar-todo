require_relative 'config/application'
require_relative 'app/controllers/list_controller.rb'

list_controller = ListController.new
command = ARGV.shift
arguments = ARGV
p arguments[0]
case command
when 'list'
  list_controller.list(arguments[0])
when 'delete'
  list_controller.delete(arguments[0], arguments[1].to_i)
when 'complete'
  list_controller.complete(arguments[0], arguments[1].to_i)
when 'add'
  list_controller.add(Task.new(arguments))
else
  puts 'invalid command'
end
