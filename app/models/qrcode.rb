class Qrcode
  def initialize(latitude:, longitude:, garden:, register: nil)
    @latitude = latitude
    @longitude = longitude
    @garden = garden
    @register = register
  end

  def build_payload
    {
      latitude: @latitude,
      longitude: @longitude,
      garden: @garden,
      register: @register
    }
  end
end
