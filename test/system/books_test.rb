require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test 'visiting the index' do
    visit books_path
    assert_selector 'h1', text: 'Books'
  end

  test 'should create book' do
    visit books_path
    click_on 'New book'

    click_on 'Create Book'

    assert_text 'Book was successfully created'
    click_on 'Back'
  end
end
