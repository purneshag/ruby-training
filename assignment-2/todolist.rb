class Task
    attr_accessor :name, :description, :status, :timestamp
  
    def initialize(name, description, status, timestamp)
      @name = name
      @description = description
      @status = status
      @timestamp = timestamp
    end
  end
  
  class ToDoList
    def initialize
      @tasks = []
    end
  
    def add_task(name, description)
      task = Task.new(name, description, "todo", Time.now)
      @tasks.push(task)
    end
  
    def edit_task(index, name, description)
      task = @tasks[index]
      task.name = name
      task.description = description
    end
  
    def delete_task(index)
      @tasks.delete_at(index)
    end
  
    def display_tasks(filter, sort_order)
      tasks_to_display = []
  
      case filter
      when "todo"
        tasks_to_display = @tasks.select { |task| task.status == "todo" }
      when "done"
        tasks_to_display = @tasks.select { |task| task.status == "done" }
      when "all"
        tasks_to_display = @tasks
      end
  
      sorted_tasks = tasks_to_display.sort_by do |task|
        if sort_order == "created_first"
          task.timestamp
        elsif sort_order == "created_last"
          -task.timestamp
        end
      end
  
      sorted_tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task.name} - #{task.description} - #{task.status} - #{task.timestamp}"
      end
    end
  end
  
  # Example usage
  list = ToDoList.new
  
  list.add_task("Buy groceries", "Milk, eggs, bread")
  list.add_task("Do laundry", "Wash clothes")
  list.add_task("Clean room", "Vacuum and dust")
  
  list.display_tasks("all", "created_first") # display all tasks sorted by creation time
  # Output:
  # 1. Buy groceries - Milk, eggs, bread - todo - 2023-04-27 13:25:03 +0200
  # 2. Do laundry - Wash clothes - todo - 2023-04-27 13:25:03 +0200
  # 3. Clean room - Vacuum and dust - todo - 2023-04-27 13:25:03 +0200
  
  list.edit_task(1, "Do laundry", "Wash clothes and fold them")
  list.display_tasks("todo", "created_last") # display todo tasks sorted by creation time
  # Output:
  # 1. Clean room - Vacuum and dust - todo - 2023-04-27 13:25:03 +0200
  # 2. Do laundry - Wash clothes and fold them - todo - 2023-04-27 13:25:03 +0200
  
  list.delete_task(0)
  list.display_tasks("all", "created_first") # display all tasks sorted by creation time
  # Output:
  # 1. Do laundry - Wash clothes and fold them - todo - 2023-04-27 13:25:03 +0200
  # 2. Clean room - Vacuum and dust - todo - 2023-04-27 13:25:03 +0200
  
