require 'pry'

class Episodes 
    attr_accessor :episode_id, :title, :season, :episode, :air_date, :characters

    @@all = []

    def initialize(episode_id:, title:, season:, episode:, air_date:, characters:)
        @episode_id = episode_id 
        @title = title 
        @season = season 
        @air_date = air_date 
        @characters = characters  
        @@all << self
    end 

    def self.all 
        @@all 
    end 

end 