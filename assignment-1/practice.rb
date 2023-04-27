#Q.1 ---Array
parray = ['Quill', 'Gamora', 'Rocket', 'Groot', 'Drax']
puts(parray[0])
puts(parray[2])

puts(:":guardian_id#{20+1_5}")

#for loop and 1 to 100 print
for i in 0..100 do
    puts(i)
end

#hash
hash1   = Hash.new
hash1 = {"Quill" => 100, "Drax" => 200, "Gamora" => 300}
print(hash1.keys, "\n")


#Method and int
def a(u) return 1 end

# driver code
a = 3
b = 2

puts(a + b)

#this passes the value of b to a method def
puts(a b)   <<-DOC
use of Begin and end keywords
puts "This is main body of program"

END
{
   puts "END of the program"
}
BEGIN
{
   puts "BEGINNING of the Program"
}
DOC
#boolean and if else
my_str_1 = "Hello"
my_str_2 = "World"

bool_1 = false
bool_2 = false

if my_str_1 == my_str_2
  bool_1 = true
  puts "It is True!"
else
  puts "It is False!"
end

if my_str_1 == my_str_1
  bool_2 = true
  puts "It is True!"
else
  puts "It is False!"
end
#Symboles uses : and similar to hash using =>
my_symbols = {:ap => "Apple", :bn => "Banana", :mg => "Mango"}

puts my_symbols[:ap]
puts my_symbols[:bn]
puts my_symbols[:mg]


#File I/O
puts "Enter a value to print the same :"
val = gets
puts val


#While loop
x = 1
while x <= 10
  puts x
  x = x + 1
end