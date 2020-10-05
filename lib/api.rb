require 'pry'

class API 
  attr_accessor :name, :episode, :quote 


  def self.fetch_characters(name) 
    url = "https://www.breakingbadapi.com/api/characters?name=#{name.first}+#{name.last}" 
    uri = URI(url)
    response = Net::HTTP.get(uri) 
    character = JSON.parse(response)
    character.each do |info| 
      Characters.new(name: info["name"], char_id: info["char_id"], birthday: info["birthday"], occupation: info["occupation"], nickname: info["nickname"], appears_in_seasons: info["appearance"], actor: info["portrayed"])
    end 
 
    
  end 

  def self.fetch_episodes(name_or_epid)
    url = "https://www.breakingbadapi.com/api/episodes"
    uri = URI(url)
    response = Net::HTTP.get(uri) 
    episode_info = JSON.parse(response)
    #episode_info.each { |ep| ep.title == name_or_epid} 
    binding.pry
  end


end 




 