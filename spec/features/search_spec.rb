require 'rails_helper'
feature 'Search garden' do
  scenario 'Successfullfy' do
    skip
    garden = Garden.create(host: 'test', latitude: '46.7118649',
                           longitude: '46.7118649')

    visit search_path
    #fill_in 'param', with: '{:latitude=>\"46.7118649\", :longitude=>\"46.7118649\", :garden=>\"test\"}'
    click_on 'Consultar'

    expect(page).to have_css('p', text: garden.host)
    expect(page).to have_css('p', text: garden.latitude)
    expect(page).to have_css('p', text: garden.longitude)
  end
end
