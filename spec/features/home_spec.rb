require 'rails_helper'

feature 'User navigate' do
  scenario 'Visit root path' do
    visit root_path

    expect(page).to have_css('li', text: 'Jardins')
    expect(page).to have_css('li', text: 'Árvores')
    expect(page).to have_css('li', text: 'Mapeamento')
    expect(page).to have_css('li', text: 'Cadastrar poda')
  end

  scenario 'User view gardens' do
    garden = Garden.create(host: 'test', latitude: '46.7118649',
                           longitude: '46.7118649')

    visit gardens_path

    expect(page).to have_css('td', text: garden.host)
    expect(page).to have_css('td', text: garden.latitude)
    expect(page).to have_css('td', text: garden.longitude)
  end

  scenario 'User create garden and view results' do
    visit new_garden_path

    fill_in 'Nome do host', with: 'se_worker_01'
    fill_in 'Latitude', with: '-23.6859718'
    fill_in 'Longitude', with: '46.7118649'
    click_on 'Cadastrar'

    expect(page).to have_css('p', text: 'se_worker_01')
    expect(page).to have_css('p', text: '-23.6859718')
    expect(page).to have_css('p', text: '46.7118649')
  end

  scenario 'User view garden details' do
    garden = Garden.create(host: 'test', latitude: '46.7118649',
                           longitude: '46.7118649')

    visit gardens_path
    click_on 'Ver detalhes'

    expect(page).to have_css('p', text: garden.host)
    expect(page).to have_css('img')
    expect(page).to have_css('p', text: garden.latitude)
    expect(page).to have_css('p', text: garden.longitude)
  end
end
