require 'csv'
CSV.open('testfile.csv', 'w+') do |csv|
  

  CSV.foreach('testfile.csv') do |row|
    c1 = row[0]
    c2 = row[1]
    csv << [c1, c2, c1*c2]
  end
end