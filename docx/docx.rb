#coding:utf-8
require 'docx'
d = Docx::Document.open('test.docx')


first_table = d.tables[0]
print "의뢰일 : "
puts first_table.rows[1].cells[1].text

print "의뢰인 : "
puts first_table.rows[2].cells[1].text

print "품종 : "
puts first_table.rows[2].cells[3].text

print "sex : "
if first_table.rows[3].cells[3].text.gsub(" ","") == "중성화수"
 puts "MC"
elsif first_table.rows[3].cells[3].text.gsub(" ","") == "중성화암"
  puts "FS"
else
  puts first_table.rows[3].cells[3].text
end


print "age : "
puts first_table.rows[3].cells[5].text

print "gross findings : "
puts first_table.rows[5].cells[0].text.gsub("1. Gross findings:","temptemptemp").gsub("2. Microscopic findings:","temptemptemp").split("temptemptemp")[1]



print "Diagnosis : "
puts first_table.rows[7].cells[0].text.gsub("Diagnosis","temptemptemp").gsub("Comments","temptemptemp").split("temptemptemp")[1]
