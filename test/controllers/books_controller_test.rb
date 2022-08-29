require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test 'should get index' do
    get books_path
    assert_response :success
  end

  test 'should get new' do
    get new_book_path
    assert_response :success
  end

  test 'should create book' do
    assert_difference('Book.count') do
      post books_path, params: { book: { name: 'test', description: 'test', author_id: 1, category_id: 1} }
    end

    assert_redirected_to books_path
  end

end
