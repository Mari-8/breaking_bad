require 'pry'

class API 
  attr_accessor :name, :episode, :quote, :seasonsrub


  def self.fetch_characters(name) 
    binding.pry
    url = "https://www.breakingbadapi.com/api/characters?name=#{name.first}+#{name.last}" 
    uri = URI(url)
    response = Net::HTTP.get(uri) 
    character = JSON.parse(response)
    character.each do |info| 
      Characters.new(name: info["name"], char_id: info["char_id"], birthday: info["birthday"], occupation: info["occupation"], nickname: info["nickname"], appears_in_seasons: info["appearance"], actor: info["portrayed"])
    end 
 
    
  end 

  def self.fetch_episodes(ans)
    url = "https://www.breakingbadapi.com/api/episodes"
    uri = URI(url)
    response = Net::HTTP.get(uri) 
    episode_info = JSON.parse(response)
    episode_info.each do |ep_info| 
      if ep_info["title"] == ans.join(' ')
         Episodes.new(episode_id: ep_info["episode_id"], title: ep_info["title"], air_date: ep_info["air_date"], main_characters: ep_info["characters"], season: ep_info["season"], episode: ep_info["episode"]) 
      else
        nil
      end
    end
    
  end

  def self.search_by_season(season_info)
    url = "https://www.breakingbadapi.com/api/episodes"
    uri = URI(url) 
    response = Net::HTTP.get(uri)
    season_list = JSON.parse(response) 
    season_list.each do |sea_li| 
      if sea_li["season"] == season_info
        Episodes.new(episode_id: sea_li["episode_id"], title: sea_li["title"], air_date: sea_li["air_date"], main_characters: sea_li["characters"], season: sea_li["season"], episode: sea_li["episode"]) 
      else 
        nil
      end
    end
  end


end 




 