require 'application_system_test_case'

class SubjectsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit subjects_url

    assert_selector 'h1', text: 'Przedmioty'
  end

  test 'add subject' do
    visit new_subject_url
    fill_in 'Nazwa Przedmiotu', with: 'Chemia'
    click_on 'Zapisz'
    assert_text :visible, 'Chemia'
  end
end
