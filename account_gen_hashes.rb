#Author: Christabel Escarez
#Last updated: August 18, 2020
#Ada Developer's Academy C14
#Ada Build: Section 6 Assessment: question  l, "Account Generator" 

#CONSTANTS
NUM_STUDENTS = 5

student_info = Hash.new()
#MAIN
puts "Please enter the full names of #{NUM_STUDENTS} students. "
i = 0
student_info[:names] = Array.new 
NUM_STUDENTS.times do 
  print "Student #{i + 1}: "
  student_info[:names] << gets.chomp.strip.upcase
  until student_info[:names][i].include?(' ')
    puts "Entry was not accepted. Please enter both first and last name."
    student_info[:names][i] = gets.chomp.strip.upcase
  end
  i += 1
end

student_info[:ids] = Array.new(NUM_STUDENTS) { rand(111111..999999) }

student_info[:emails] = Array.new 
student_names.each_with_index { |name, i| student_emails << student_names[i][0] + student_names[i].split(' ')[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org" }
# student_info[:names].each_with_index do |name, i|
#   split_name = student_info[:names][i].split(' ')
#   split_id = student_info[:ids][i].to_s.split('')
#   student_info[:emails] << student_info[:names][i][0] + split_name[-1] + split_id[-3] + split_id[-2] + split_id[-1] + "@adadevelopersacademy.org"
# end

print "\n"
printf("%-45s", "Name")
printf("%-10s", "ID")
printf("%-45s", "Email")
print "\n"
student_names.each_with_index do |name, i|
  printf("%-45s", name)
  printf("%-10s", student_ids[i])
  printf("%-45s", student_emails[i])
  print "\n"






## If names to be read into from an external file
# 1. change the name of the external file in the below code (currently coded as: "names.txt")
# 2. ensure names are separated by a line-break in the external file
# 3. Uncomment the below code block and comment out the following code block (end marked with "END BLOCK")

##################### UNCOMMENT THIS CODE TO ADD STUDENT NAMES FROM AN EXTERNAL FILE #############
external_file_data = File.readlines("names.txt")
NUM_STUDENTS = external_file_data.length

student_names = []
external_file_data.each do |name|
  student_names << name.strip.upcase
end
###################################### END BLOCK #########################################
##################### UNCOMMENT THIS CODE TO MANUALLY ADD STUDENT ACCOUNTS #############
# #CONSTANTS
# NUM_STUDENTS = 5

# #MAIN
# puts "Please enter the full names of #{NUM_STUDENTS} students. "

# student_names = []
# i = 0
# NUM_STUDENTS.times do 
#   print "Student #{i + 1}: "
#   student_names << gets.chomp.strip.upcase
#   until student_names[i].include?(' ')
#     puts "Entry was not accepted. Please enter both first and last name."
#     student_names[i] = gets.chomp.strip.upcase
#   end
#   i += 1
# end
###################################### END BLOCK #########################################

student_ids = []
until student_ids.uniq.length == NUM_STUDENTS
  id = rand(111111..999999) 
  while id.to_s[-3..-1].to_i < 100
    id = rand(111111..999999) 
  end
  student_ids << rand(111111..999999) 
end

student_emails = []
student_names.each_with_index do |name, i| 
  split_names = name.split(' ')
  split_names.delete(' ')
  if split_names.length > 2
    name_initials = ""
    split_names.each do |partial_name|
      name_initials << partial_name[0] 
    end
    #name_initials includes initial for last name, so range must be used to exclude final character when building email addresses
    student_emails << name_initials[0..-2] + split_names[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org"
  else
    student_emails << student_names[i][0] + split_names[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org"
  end
end


end##################################### END BLOCK #########################################