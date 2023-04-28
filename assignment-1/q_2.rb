##Q.2 ---Write a program to check if a value exists in an array.

arr = [ "cow", "elephant", "cat", "dog" ]

searchStr = "cow"
puts arr.include?(searchStr)?
"#{searchStr} is present in the array" :
"#{searchStr} is not present in the array"


searchStr = "rat"
puts arr.include?(searchStr)?
"#{searchStr} is present in the array" :
"#{searchStr} is not present in the array"
