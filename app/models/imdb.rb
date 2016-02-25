class IMDB
  attr_reader :success, :title, :year, :director, :actors

  def initialize(movie)
    response = Unirest.post("https://imdb.p.mashape.com/movie",
      headers:{
        "X-Mashape-Key" => "tXp52AcbQimsh2nLBAlSKLGvtsnAp1somK0jsnyTRFn0fSAHGh",
        "Content-Type" => "application/x-www-form-urlencoded",
        "Accept" => "application/json"
      },
      parameters:{
        "searchTerm" => "#{movie}"
      }).body

    @success = response["success"]
    @title = response["result"]["title"]
    @year = response["result"]["year"]
    @director = response["result"]["director"]
    @actors = response["result"]["cast"]
  end

  def get_actor_list
    array = []
    actors.each do |a|
      array << a["actor"]
    end
    array
  end

  def get_actor_role(actor)
    roles = []
    temp = @actors.select {|a| a["actor"] == actor}
    temp.each {|t| roles << t["role"]}
    roles
  end
end
