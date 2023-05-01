class Task
    attr_accessor :name, :description, :status, :timestamp
    
    def initialize(name, description, status)
      @name = name
      @description = description
      @status = status
      @timestamp = Time.now
    end
  end
  
  class ToDoList
    attr_accessor :tasks
    
    def initialize
      @tasks = []
    end
    
    def add_task
      puts "Enter task name:"
      name = gets.chomp
      puts "Enter task description:"
      description = gets.chomp
      status = "todo"
      task = Task.new(name, description, status)
      @tasks << task
      puts "Task added!"
    end
    
    def edit_task
      puts "Enter task index:"
      index = gets.chomp.to_i
      if index >= @tasks.length
        puts "Invalid task index."
        return
      end
      puts "Enter new task name (or press enter to skip):"
      name = gets.chomp
      puts "Enter new task description (or press enter to skip):"
      description = gets.chomp
      if name != ""
        @tasks[index].name = name
      end
      if description != ""
        @tasks[index].description = description
      end
      puts "Task edited!"
    end
    
    def delete_task
      puts "Enter task index:"
      index = gets.chomp.to_i
      if index >= @tasks.length
        puts "Invalid task index."
        return
      end
      @tasks.delete_at(index)
      puts "Task deleted!"
    end
    
    def display_tasks(filter, sort)
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
      sorted_tasks.each_with_index do |task, index|
        puts "#{index}: #{task.name} (#{task.description}) - #{task.status} (#{task.timestamp})"
      end
    end
  end
  
  todo_list = ToDoList.new
  
  loop do
    puts "What do you want to do?"
    puts "1. Add task"
    puts "2. Edit task"
    puts "3. Delete task"
    puts "4. Display tasks"
    puts "5. Quit"
    choice = gets.chomp.to_i
    case choice
    when 1
      todo_list.add_task
    when 2
      todo_list.edit_task
    when 3
      todo_list.delete_task
    when 4
      puts "Filter by: 1. todo, 2. done, 3. all"
      filter = gets.chomp.to_i
      puts "Sort by: 1. created first, 2. created last"
      sort = gets.chomp.to_i
      todo_list.display_tasks(filter, sort)
    when 5
      break
    else
      puts "Invalid choice."
    end
  end
  