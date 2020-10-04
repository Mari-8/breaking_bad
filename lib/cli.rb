require 'pry'
class CLI 
    attr_accessor :yes_or_no

    def start 
        puts "" 
        puts "Hello! Welcome to the Breaking Bad CLI App!"
        puts ""
        puts "You can choose to see information on characters, or episodes! Please enter which one you'd like to know more about!"
        selection = gets.chomp
        first_option_choice(selection) 
        puts ""
        puts "would you like to look for something else? input Yes or No."
        @yes_or_no = gets.chomp
        if @yes_or_no == "Yes" 
            new_question = CLI.new
            new_question.start_after_first 
        else 
           "Thank you for using my Breaking Bad CLI!"
        end 
        

    end 

    def start_after_first
        puts "Another question? Ask away! Is it about characters, or episodes?"
        selection = gets.chomp
        first_option_choice(selection) 
        puts ""
        puts "would you like to look for something else? input Yes or No."
        @yes_or_no_two = gets.chomp
        if @yes_or_no_two == "Yes" 
            new_question = CLI.new
            new_question.start_after_first 
        else 
           "Thank you for using my Breaking Bad CLI!"
        end 
    end

    def first_option_choice(selection)

        if selection == "Characters" 
            puts ""
            puts "Please enter the name of the character youd like to learn about!" 
            full_name = gets.chomp
            name = full_name.split(' ')
            name_info = API.fetch_characters(name)  
            @char = Characters.all.find { |info| info.name == name.join(' ')} 
            print_character(@char)
        elsif selection == "Episodes" 
            puts "Please enter the name of the episode, or the season and episode number you would like to learn about!" 
            name_or_epid = gets.chomp

        else 
            puts ""
            quote = gets.chomp
        end
    end 

    def print_character(char) 
        puts "Name: #{char.name}"
        puts "~~~~~"
        puts "Nickname: #{char.nickname}"
        puts "~~~~~"
        puts "Birthday: #{char.birthday}"
        puts "~~~~~" 
        puts "Occupation: #{char.occupation}"
        puts "~~~~~" 
        puts "Appears in seasons: #{char.appears_in_seasons}"
        puts "~~~~~"
    end 

    #def start_or_end(yes_or_no)
    #    if @yes_or_no == "yes" 
    #        CLI.start 
    #    else 
     #       nil
     #   end
    #end 


end 