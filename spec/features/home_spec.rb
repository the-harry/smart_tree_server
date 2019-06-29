require 'rails_helper'

feature 'User navigate' do
  scenario 'Visit root path' do
    visit root_path

    expect(page).to have_css('li', text: 'Mapeamento')
    expect(page).to have_css('li', text: 'Criar jardim')
    expect(page).to have_css('li', text: 'Árvores')
  end

  scenario 'User create garden' do
    visit root_path
    click_on 'Criar jardim'
    fill_in 'Bairro', with: 'Sé'
    fill_in 'Latitude', with: '-23.6859718'
    fill_in 'Longitude', with: '46.7118649'
  end
end
