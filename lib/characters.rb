require 'pry'

class Characters 
    attr_accessor :char_id, :name, :birthday, :occupation, :nickname, :appears_in_seasons, :actor

    @@all = []

    def initialize(name:, char_id:, birthday:, occupation:, nickname:, appears_in_seasons:, actor:)
        @name = name 
        @char_id = char_id 
        @birthday = birthday 
        @occupation = occupation 
        @nickname = nickname 
        @appears_in_seasons = appears_in_seasons 
        @actor = actor 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 


end 