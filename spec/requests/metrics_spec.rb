require 'rails_helper'
describe 'Worker send metrics', type: :request do
  it "Receive basic garden info" do
    payload = {
               host: 'pyworker1',
               latitude: 33.6867772,
               longitude: 22.6844472
              }

    post '/api/v1/metrics', params: payload

    expect(response).to have_http_status(:created)
  end
end
