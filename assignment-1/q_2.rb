##Q.2 ---Write a program to check if a value exists in an array.

arr = [ "cow", "elephant", "cat", "dog" ]

def search(arr,searchStr)
    puts arr.include?(searchStr)?
    "#{searchStr} is present in the array" :
    "#{searchStr} is not present in the array"
end

search(arr, "rat") 
search(arr, "cow")
