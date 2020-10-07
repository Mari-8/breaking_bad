require 'pry'

class Episodes 
    attr_accessor :episode_id, :title, :season, :episode, :air_date, :main_characters

    @@all = []

    def initialize(episode_id:, title:, season:, episode:, air_date:, main_characters:)
        @episode_id = episode_id 
        @title = title 
        @season = season 
        @air_date = air_date 
        @main_characters = main_characters 
        @episode = episode 
        @@all << self
    end 

    def self.all 
        @@all 
    end 

end 