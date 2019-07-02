class Api::V1::MetricsController < ActionController::API
  def create
    garden = find_host(params)
    metrics = Metric.new(garden: garden,
                         latitude: latitude,
                         longitude: longitude,
                         payload: **payload
                        )
    if metrics.save_influx
      head: :created
    else
      render status: :not_found, json: { msg: 'Erro ao salvar métrica.' }
    end
  end
end
