class MyAPIFilm
  attr_reader :success, :title, :year, :directors, :writers, :actors, :runtime
  def initialize(movie)
    response = HTTParty.get("http://api.myapifilms.com/imdb/idIMDB?title=#{movie}&actors=1&token=#{ENV["MYAPIFILMS_KEY"]}")
    @success = !(response["data"]["movies"].empty?)
    if @success
      @title = response["data"]["movies"][0]["title"]
      @year = response["data"]["movies"][0]["year"].to_i
      @directors = response["data"]["movies"][0]["directors"]
      @writers = response["data"]["movies"][0]["writers"]
      @actors = response["data"]["movies"][0]["actors"]
      @runtime = response["data"]["movies"][0]["runtime"][0]
    end
  end

  def get_directors_list
    array = []
    @directors.each {|d| array << d["name"]}
    array
  end

  def get_actors_name_list
    array = []
    @actors.each {|a| array << a["actorName"] }
    array
  end

  def get_writers_list
    array = []
    @writers.each {|w| array << w["name"]}
    array
  end
end
