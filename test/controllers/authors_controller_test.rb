require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test 'should get index' do
    get authors_url
    assert_response :success
  end

  test 'should get new' do
    get new_author_url
    assert_response :success
  end

  test 'should create author' do
    assert_difference('Author.count') do
      post authors_url, params: { author: { name: 'test'} }
    end

    assert_redirected_to author_url(Author.last)
  end
end
