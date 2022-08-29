require 'application_system_test_case'

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test 'visiting the index' do
    assert_selector 'h1', text: 'Authors'
  end

  test 'should create author' do
    click_on 'New author'

    click_on 'Create Author'

    assert_text 'Author was successfully created'
    click_on 'Back'
  end
end
