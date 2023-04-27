#Classes, methods and modules



class Purnesh
    # defining instance method getAge
 def getAge(n)

    @pagAge = n
end

def incrementAge()
    @pagAge +=1
end

def displayDetails()
    puts "Purnesh age is #@pagAge"
end

end

obj = Purnesh.new

obj.getAge(20)
obj.displayDetails()
obj.incrementAge()
obj.displayDetails()