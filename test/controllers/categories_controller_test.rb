require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test 'should get index' do
    get categories_path
    assert_response :success
  end

  test 'should get new' do
    get new_category_path
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post categories_path, params: { category: { name: 'test' } }
    end

    assert_redirected_to categories_path
  end
end
