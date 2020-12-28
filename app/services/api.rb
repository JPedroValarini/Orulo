class Api 
  include HTTParty

  BASE_URL = ENV.fetch('BASE_URL', 'https://www.orulo.com.br').freeze
  TOKEN = ENV.fetch('TOKEN', 'default')

  def  initialize
    @options = {}
  end

  def buildings(page)
    HTTParty.get(
      "#{BASE_URL}/buildings",
      headers: {"Authorization" => "Bearer #{TOKEN}"},
      query: { page: page }
    )
  end
end