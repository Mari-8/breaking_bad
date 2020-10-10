require 'pry'
class CLI 
    attr_accessor :yes_or_no, :name, :season

    def start 
        puts ""
        puts "Hello! Welcome to the Breaking Bad CLI App!"
        puts " "   
        puts "You can choose to see information on characters, or episodes! Please enter which one you'd like to know more about!"
        selection = gets.chomp.capitalize
        first_option_choice(selection) 
        puts ""
        puts "would you like to look for something else? input Yes or No."
        @yes_or_no = gets.chomp.capitalize
        if @yes_or_no == "Yes" 
            new_question = CLI.new
            new_question.start_after_first 
        else @yes_or_no == "No" 
           puts "Thank you for using my Breaking Bad CLI!"
        end
        

    end 

    def start_after_first
        puts "Another question? Ask away! Is it about characters, or episodes?"
        selection = gets.chomp.capitalize
        first_option_choice(selection) 
        puts ""
        puts "would you like to look for something else? input Yes or No."
        @yes_or_no_two = gets.chomp.capitalize
        if @yes_or_no_two == "Yes" 
            new_question = CLI.new
            new_question.start_after_first 
        else
           puts "Thank you for using my Breaking Bad CLI!"
        end
    end

    def full_name
        @full_name = gets.chomp.split(' ')
        @full_name.each { |name| name.capitalize! }
    end 

    def user_input_title 
        @ep_title = gets.chomp.capitalize
            if @ep_title == "List"
                puts ""
                puts "What season would you like to see?"
                season_info = gets.chomp.to_s
                season_list = API.search_by_season(season_info)
                @sea = Episodes.all.select { |sea_inf| sea_inf.season == season_info }
                print_season(@sea)
            else
                ans = @ep_title.split(' ') 
                ans.each { |i| i.capitalize! }
                ques_answer = API.fetch_episodes(ans)
                @ep = Episodes.all.find { |ep_info| ep_info.title == ans.join(' ')}
           
                print_episode(@ep)
            end
    end

    def first_option_choice(selection)

        if selection == "Characters" 
            puts ""
            puts "Please enter the name of the character youd like to learn about!"
            full_name
            name = @full_name 
            name_info = API.fetch_characters(name)   
            @char = Characters.all.find { |info| info.name == name.join(' ') } 
            print_character(@char)
        elsif selection == "Episodes" 
            puts ""
            puts "Please enter the title of the episode you would like to learn about, or type list to see a list of episodes titles!"
            user_input_title
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
        puts ""
        puts "#{ep.main_characters.join("," " ")}"
    end 

    def print_season(sea)
        i = 0
        puts "Episodes in season #{sea[i].season}:"
        until i == sea.length 
        puts  ">: #{sea[i].title}"
        i += 1 
        end 
    end 

    class MyError < StandardError
        def message
            "Input not found. Check your spelling, and remember to always capitalize the first letter!"
          
        end
    end

end