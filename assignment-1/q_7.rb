require 'csv'

csv_data = CSV.read('csvfile.csv', headers: false)

csv_data.each do |row|
  row[2] = row[0].to_i * row[1].to_i
end

CSV.open('csvfile.csv', 'w') do |csv|
  csv_data.each do |row|
    csv << row
  end
end
