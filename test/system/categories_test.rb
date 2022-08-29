require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test 'visiting the index' do
    visit categories_path
    assert_selector 'h1', text: 'Categories'
  end

  test 'should create category' do
    visit categories_path
    click_on 'New category'

    click_on 'Create Category'

    assert_text 'Category was successfully created'
    click_on 'Back'
  end
end
