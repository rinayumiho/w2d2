require_relative "employee"
require_relative "startup"

starup_list = Hash.new
puts "Welcome to the Startup System"
puts "*" * 30
puts "Please select your service:"
puts "1, Create a new startup"
puts "2, Hire an employee"
# puts "3, Pay employees"
# puts "4, Show average salary"
# puts "5, Close a startup"
# puts "6, Aquire another startup"
puts "3, Quit system"
puts "*" * 30
input = gets.chomp
while input != "3"
    if input == "1"
        puts "Please enter the name of the startup(String), funding(Integer), and salaries(Hash with titles as keys, stipends as values)."
        puts "Each element is separate with one space."
        arr = gets.chomp.split
        startup_list .add Startup.new(arr[0], arr[1], arr[2])
        puts "Creation done"
    elsif input == "2"
        raise "Unavailable service" if startup_list.empty?
        puts "Please enter the name of the startup"
        puts startup_list.keys.join(" ")
        startup = startup_list(gets.chomp)
        puts "Please enter the information of the employee(name(String), title(String) separated by one space)"
        startup.hire(*gets.chomp.split)
        puts "Hiring done"
    elsif inputs != "3"
        puts "Invalid input, please re-enter again: "
        input = gets.chomp
    end
end

