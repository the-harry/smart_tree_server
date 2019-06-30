class Qrcode
  def initialize(latitude:, longitude:, garden:)
    @latitude = latitude
    @longitude = longitude
    @garden = garden
  end

  def build_payload
    {
      latitude: @latitude,
      longitude: @longitude,
      garden: @garden
    }
  end
end
