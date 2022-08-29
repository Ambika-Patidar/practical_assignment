require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test 'should get index' do
    get authors_path
    assert_response :success
  end

  test 'should get new' do
    get new_author_path
    assert_response :success
  end

  test 'should create author' do
    assert_difference('Author.count') do
      post authors_path, params: { author: { name: 'test'} }
    end

    assert_redirected_to authors_path
  end
end
