class TaskView
  def self.show(tasks)
    tasks.each_with_index do |task , index|
      print "#{index + 1}. "
      print "["
      task.status == "complete" ? (print "X") : (print " ")
      print "] "
      print task.description + ' '
      task.tags.each do |tag|
        print '#' + tag.name + ' '
      end
      print "\n"
    end
  end
end
