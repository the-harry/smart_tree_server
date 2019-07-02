class Api::V1::MetricsController < ActionController::API
  def create
    garden = find_garden(params)
    payload = build_payload(params)

    metrics = Metric.new(garden: garden, payload: payload)
    if metrics.save_influx
      head: :created
    else
      render status: :not_found, json: { msg: 'Erro ao salvar métrica.' }
    end
  end

  private

  def find_garden; end

  def build_payload; end
end
