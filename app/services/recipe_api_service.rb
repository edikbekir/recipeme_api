require 'net/http'

class RecipeApiService
  RECIPE_API_KEY = ENV['RECIPE_API_KEY'].freeze
  RECIPE_API_URL = ENV['RECIPE_API_URL'].freeze

  def self.search(query=nil, offset=0, limit=10)
    params = { query: query, offset: offset, limit: limit }
    url = get_url(:search, params)

    return if query.nil? || url.nil?

    get_request(:search, params)["results"]
  end

  def self.ingredients(id)
    return if id.nil?

    get_request(:ingredients, { id: id })
  end

  def self.instructions(id)
    return if id.nil?

    get_request(:instructions, { id: id })
  end

  private

  def self.get_url(action, params)
    case action
    when :search
      req_params = { apiKey: RECIPE_API_KEY, query: params[:query], offset: params[:offset], limit: params[:limit]}.to_query
      "#{RECIPE_API_URL}/search?#{req_params}"
    when :ingredients
      req_params = { apiKey: RECIPE_API_KEY }.to_query
      "#{RECIPE_API_URL}/#{params[:id]}/priceBreakdownWidget.json?#{req_params}"
    when :instructions
      req_params = { apiKey: RECIPE_API_KEY }.to_query
      "#{RECIPE_API_URL}/#{params[:id]}/analyzedInstructions?#{req_params}"
    else
      nil
    end
  end

  def self.get_results(data)
    JSON.parse(data)
  end

  def self.get_request(action, params)
    url = get_url(action, params)

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    @response = http.get(uri.request_uri)

    get_results(@response.body)
  end
end
