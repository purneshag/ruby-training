#Write a method to double all the elements in an array.
#

arr1 = ["dog",20,30,"cat",50]
arr2 = arr1

s=arr1.size + arr2.size
arr3 = Array.new(s)

count=0
count1=0

while(count<s)
    if(count<arr1.size)
        arr3[count]=arr1[count]
    else
        arr3[count]=arr2[count1]
        count1=count1 + 1
    end
    count = count + 1
end

print "Merged array: \n"
i=0;
while(i<s)
    print arr3[i]," "
    i=i+1
end