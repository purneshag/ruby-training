# I/O prac -- Miscellaneous- Block, Proc, Lamda, Yield

student_roll = ["pot","top","mop","cat","dog"]

student_roll.each do |student_roll| 
    puts student_roll
end


[1, 2, 3].each do |num|
    puts num
  end

def one_two_three
    yield 1
    yield 2
    yield 3
end
  
one_two_three { |number| puts number * 10 }
 
my_lambda = -> { puts "Lambda called" }

my_lambda.call
my_lambda.()
my_lambda[]
my_lambda.===

times_two = ->(x) { x * 2 }
puts(times_two.call(10))
