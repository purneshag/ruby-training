class Task
    attr_accessor :name, :description, :status, :timestamp
    
    def initialize(name, description, status)
      @name = name
      @description = description
      @status = status
      @timestamp = Time.now.strftime("%d/%m/%Y - %H:%M")
    end
  end
  
  class ToDoList
    attr_accessor :tasks
    
    def initialize
      @tasks = []
    end
    
    def add_task
      puts "==>Enter task name:"
      name = gets.chomp
      description = []
      puts "Enter description (enter 'quit' or 'exit' to stop): "
      loop do
        description_line = gets.chomp.downcase
        break if description_line.match?(/^(exit|quit)$/i)
        description << description_line
      end
      
      status = "todo"
      task = Task.new(name, description, status)
      @tasks << task
      puts "Task added!"
    end
    
    def update_task_status
      display_tasks(3, 1, 0)
      puts "==>Enter task index:"
      index = gets.chomp.to_i
      if index >= @tasks.length
        puts "Invalid task index."
        return
      end
      puts "==>Enter 1 to update todo to done"
      choice = gets.chomp.to_i
      case choice
      when 1
        @tasks[index].status = "done"
        puts "Status updated"
      else
        puts "Status not updated"
        return
      end
    end
    
    def delete_task
      display_tasks(3, 1, 0)
      puts "==>Enter task index:"
      index = gets.chomp.to_i
      if index >= @tasks.length
        puts "Invalid task index."
        return
      end
      puts "Deleted task is: "
      puts @tasks[index].name
      @tasks.delete_at(index)      
    end
    
    def display_tasks(filter, sort, display_type)
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
  
  todo_list = ToDoList.new
  
  loop do
    puts "==================BEGIN======================"
    puts "Tasks in the list"
    todo_list.display_tasks(3, 1, 2)
    puts "Actions:"
    puts "1. Add task"
    puts "2. Update task status"
    puts "3. Delete task"
    puts "4. Display tasks"
    puts "5. Display tasks with filter"
    puts "6. Expand task"
    puts "7. Quit"
    puts "============================================="
    puts "==>Enter Action"
    choice = gets.chomp.to_i
    case choice
    when 1
      todo_list.add_task
    when 2
      todo_list.update_task_status
    when 3
      todo_list.delete_task
    when 4
      todo_list.display_tasks(3, 1, 0)
    when 5
      puts "Filter by: 1. todo, 2. done, 3. all"
      filter = gets.chomp.to_i
      puts "Sort by: 1. created first, 2. created last"
      sort = gets.chomp.to_i
      todo_list.display_tasks(filter, sort, 0)
    when 6
      todo_list.display_tasks(3, 1, 1)
    when 7
      break
    else
      puts "Invalid choice."
    end
  end
  