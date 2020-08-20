#Author: Christabel Escarez
#Last updated: August 18, 2020
#Ada Developer's Academy C14
#Ada Build: Section 6 Assessment: question  l, "Account Generator" 

#CONSTANTS
NUM_STUDENTS = 5

#MAIN
puts "Please enter the full names of #{NUM_STUDENTS} students. "

student_info = Array.new(NUM_STUDENTS) { {name: "", id: 0, email: ""} } 

student_info.each_with_index do |student, i|
  print "Student #{i + 1}: "
  student[:name] << gets.chomp.strip.upcase
  until student[:name].to_s.include?(' ')
    puts "Entry was not accepted. Please enter both first and last name."
    student[:name] << gets.chomp.strip.upcase
  end

  student[:id] = rand(111111..999999) 

  split_names = student[:name].split(' ')
  split_names.delete(' ')
  if split_names.length > 2
    name_initials = ""
    split_names.each do |partial_name|
      name_initials << partial_name[0] 
    end
    #name_initials includes initial for last name, so range must be used to exclude final character when building email addresses
    student[:email] << name_initials[0..-2] + split_names[-1] + student[:id].to_s[-3..-1] + "@adadevelopersacademy.org"
  else
    student[:email] << student[:name][i][0] + split_names[-1] + student[:id].to_s[-3..-1] + "@adadevelopersacademy.org"
  end

end

print "\n"
printf("%-45s", "Name")
printf("%-10s", "ID")
printf("%-45s", "Email")
print "\n"
student_info.each_with_index do |student|
  printf("%-45s", student[:name])
  printf("%-10s", student[:id])
  printf("%-45s", student[:email])
  print "\n"
end