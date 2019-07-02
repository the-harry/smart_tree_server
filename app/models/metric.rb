class Metric
  def initialize(garden:, **payload)
    @garden = garden
    @payload = payload
  end

  def save_influx; end
end
