module WeatherWeasel
  class CurrentHurricane

    def initialize(client)
      @client = client
    end

    def raw_data
      @data ||= @client.parse_url("currenthurricane/view.json")
    end
  end
end
