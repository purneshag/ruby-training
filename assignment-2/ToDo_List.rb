require_relative 'variables.rb'


class ToDoList
  attr_accessor :tasks
      
  def initialize
    @tasks = []
  end
     
  def add_task(name, description)
    @tasks << Task.new(name, description, status = "todo")
    puts "Task added!"
  end
      
  def update_task_status(index, choice = ch_done)
    case choice
    when 1
      @tasks[index].status = "done"
      puts "Status updated"
    else
      puts "Status not updated"
      return
    end
  end
   
  def delete_task(index)
    if index >= @tasks.length
      puts "Invalid task index."
      return
    end
    puts "Deleted task is: "
    puts @tasks[index].name
    @tasks.delete_at(index)      
  end
     
  def display_tasks(filter = $flt_all, sort = $str_ascending, display_type = $d_type_top)
    puts "---------------------------------------------"
    filtered_tasks = []
    case filter
    when 1
      filtered_tasks = @tasks.select { |task| task.status == "todo" }
    when 2
      filtered_tasks = @tasks.select { |task| task.status == "done" }
    when 3
      filtered_tasks = @tasks
    else
      puts "Invalid filter."
      return
    end
    sorted_tasks = []
    case sort
    when 1
      sorted_tasks = filtered_tasks.sort_by { |task| task.timestamp }
    when 2
      sorted_tasks = filtered_tasks.sort_by { |task| task.timestamp }.reverse
    else
      puts "Invalid sort."
      return
    end
    if display_type == 0
      sorted_tasks.each_with_index do |task, index|
        puts "#{index}: #{task.name} - #{task.status} (#{task.timestamp})"
      end
    elsif display_type == 1
      puts "==>Enter index to expand"
      index = gets.chomp.to_i
      puts "---------------------------------------------"
      puts "#{index}: Title: #{@tasks[index].name} Description: (#{@tasks[index].description}) - Status: #{@tasks[index].status} Created time: (#{@tasks[index].timestamp})" 
    elsif display_type == 2
      sorted_tasks = tasks.slice(0,5)
      sorted_tasks.each_with_index do |task, index|
        puts "#{index}: #{task.name} - #{task.status} (#{task.timestamp})"
      end
    end
    todo_count = tasks.count { |task| task.status == "todo" }
    done_count = tasks.count { |task| task.status == "done" }
    puts "---------------------------------------------"
    puts "TODO tasks: #{todo_count}"
    puts "DONE tasks: #{done_count}"
    puts "Total Tasks: #{todo_count + done_count} " 
    puts "---------------------------------------------"
  end
end
  