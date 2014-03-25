class Soma < Struct.new :base_uri, :token
  
  def self.auth(base_uri)
    response = RestClient.post("#{ENV['BASE_URI']}/app_auth", {app: 1, key: "#{ENV['SOMA_KEY']}"})

    if response.code == 200
      puts "%" * 80
      token = create_token_with(response.body)
      puts token
      puts "%" * 80
      #connects to soma and authenticates
      # if it worked it will then create new one
      return new(base_uri, token)
    else
      raise "Could not connect to SOMA"
    end
  end

  def legend
    get(:"/legend")
  end

  def show_all
    get(:".json")
  end

  def show(id)
    get(:"/#{id}.json")
  end

  def show_results_for(test)
    get(:"/results/#{test}")
  end

  def send_blood_test_result(body_params)
    post(:"/remote", body_params)
  end

  private
  def get(url)
    HTTParty.get("#{base_uri}#{url}?token=#{token}")
  end

  def post(url, body_params)
    HTTParty.post("#{base_uri}#{url}", body: body_params)
  end

  def self.create_token_with(response)
    Digest::HMAC.hexdigest(JSON.parse(response)['challenge'], "#{ENV['SOMA_SECRET']}", Digest::SHA1)
  end
end