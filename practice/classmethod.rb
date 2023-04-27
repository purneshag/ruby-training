#Classes, methods and modules



class Person
    # defining instance method getAge
    def getAge(n)

        @age = n
    end

    def incrementAge
        @age +=1
    end

    def displayDetails
        puts "Purnesh age is #@age"
    end

end

obj = Person.new

obj.getAge(20)
obj.displayDetails
obj.incrementAge
obj.displayDetails