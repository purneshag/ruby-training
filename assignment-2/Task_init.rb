
require_relative 'ToDo_List'

class Task
  attr_accessor :name, :description, :status, :timestamp
      
  def initialize(name, description, status)
    @name = name
    @description = description
    @status = status
    @timestamp = Time.now.strftime("%d/%m/%Y - %H:%M")
  end
end
