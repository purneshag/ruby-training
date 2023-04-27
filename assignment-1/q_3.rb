#Q.3 ---To join tow array

arr1 = [10,20,30,40,50]
arr2 = [60,70,80]
arr3 = Array.new(8)

count = 0;
count1 = 0;

while count < 8 
    if count < arr1.size
        arr3[count] = arr1[count]
    else
        arr3[count] = arr2[count1]
        count1 += 1
    end
    count += 1
end

puts "Merged array: \n"
i = 0;
while i < 8
    print arr3[i]," "
    i += 1
end