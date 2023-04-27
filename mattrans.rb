#Write a program to transpose an N*N matrix
#


TwoDArr = Array.new(3){Array.new(3)}
sum = 0;

printf "Enter elements of MATRIX:\n";
i = 0;
while (i < 3)
  j = 0;
  while (j < 3)
    printf "ELEMENT [%d][%d]: ", i, j;
    TwoDArr[i][j] =  gets.chomp.to_i;
    j = j + 1;
  end
  i = i + 1;
end

printf "MATRIX:\n";
i = 0;
while (i < 3)
  j = 0;
  while (j < 3)
    print TwoDArr[i][j]," ";
    j = j + 1;
  end
  i = i + 1;
  print "\n";
end

printf "Transpose of matrix:\n";
i = 0;
while (i < 3)
  j = 0;
  while (j < 3)
    print TwoDArr[j][i]," ";
    j = j + 1;    end
  i = i + 1;
  print "\n";
end