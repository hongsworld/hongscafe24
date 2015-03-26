require 'csv'

csv_text = File.read('./table.csv')

csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  puts row
end

