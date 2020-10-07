require 'pry'
class CLI 
    attr_accessor :yes_or_no, :name

    def start 
        puts "" 
        puts "Hello! Welcome to the Breaking Bad CLI App!"
        puts ""
        puts "You can choose to see information on characters, or episodes! Please enter which one you'd like to know more about!"
        selection = gets.chomp.capitalize
        first_option_choice(selection) 
        puts ""
        puts "would you like to look for something else? input Yes or No."
        @yes_or_no = gets.chomp
        if @yes_or_no == "Yes" 
            new_question = CLI.new
            new_question.start_after_first 
        elsif @yes_or_no = "No" 
           puts "Thank you for using my Breaking Bad CLI!"
        else 
            begin
                raise MyError
              rescue MyError => e 
                puts "~~~~~~~~~~~~~~~~~~~~~~~~"
                puts e.message
                puts "~~~~~~~~~~~~~~~~~~~~~~~~"
            end
        end 
        

    end 

    def start_after_first
        puts "Another question? Ask away! Is it about characters, or episodes?"
        selection = gets.chomp.capitalize
        first_option_choice(selection) 
        puts ""
        puts "would you like to look for something else? input Yes or No."
        @yes_or_no_two = gets.chomp
        if @yes_or_no_two == "Yes" 
            new_question = CLI.new
            new_question.start_after_first 
        elsif @yes_or_no_two == "No" 
           puts "Thank you for using my Breaking Bad CLI!"
        else  
            begin
                raise MyError
              rescue MyError => e 
                puts "~~~~~~~~~~~~~~~~~~~~~~~~"
                puts e.message
                puts "~~~~~~~~~~~~~~~~~~~~~~~~"
            end
        end 
    end

    def first_option_choice(selection)

        if selection == "Characters" 
            puts ""
            puts "Please enter the name of the character youd like to learn about!" 
            full_name = gets.chomp
            if full_name != full_name.capitalize 
                begin
                    raise MyError
                  rescue MyError => e 
                    puts "~~~~~~~~~~~~~~~~~~~~~~~~"
                    puts e.message
                    puts "~~~~~~~~~~~~~~~~~~~~~~~~"
                end
            end
            first_option_choice(selection)
            name = full_name.split(' ')
            name_info = API.fetch_characters(name)  
            @char = Characters.all.find { |info| info.name == name.join(' ') } 
            print_character(@char)
        elsif selection == "Episodes" 
            puts ""
            puts "Please enter the name of the episode, or the season and episode number you would like to learn about!" 
            name_or_epid = gets.chomp
            ques_answer = API.fetch_episodes(name_or_epid)
            @ep = Episodes.all.find { |ep_info| ep_info.title == name_or_epid}
            print_episode(@ep)
        else 
            begin
                raise MyError.new "Input not found. Check your spelling, and remember to always capitalize the first letter!"
            rescue MyError => e 
                puts "~~~~~~~~~~~~~~~~~~~~~~~~"
                puts e.message
                puts "~~~~~~~~~~~~~~~~~~~~~~~~"
            end
        end
    end 

    def print_character(char) 
        puts ""
        puts "Name: #{char.name}"
        puts "~~~~~"
        puts "Nickname: #{char.nickname}"
        puts "~~~~~"
        puts "Birthday: #{char.birthday}"
        puts "~~~~~" 
        puts "Occupation: #{char.occupation.join("," " ")}"
        puts "~~~~~"
        puts "Appears in seasons: #{char.appears_in_seasons.join("," " ")} "
        puts "~~~~~"
    end 

    def print_episode(ep)
        puts ""
        puts "Title: #{ep.title}"
        puts "~~~~~"
        puts "Season: #{ep.season}, Episode: #{ep.episode}" 
        puts "~~~~~"
        puts "Aired on: #{ep.air_date}" 
        puts "~~~~~"
        puts "Main Characters:"
        puts "#{ep.main_characters.join("," " ")}"
    end 

    class MyError < StandardError
        def message
            "Input not found. Check your spelling, and remember to always capitalize the first letter!"
          
        end
    end

end