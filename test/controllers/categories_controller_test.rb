require 'test_helper'
 class CategoriesControllerTest < ActionDispatch::IntegrationTest
    def setup
        @category = Category.create(name: "sport")
    end
    test "should get index" do
        get categories_path
        assert_response :success
    end
    test "should get edit" do
        get new_category_path
        assert_response :success
    end
    test "should get show" do
        get category_path(@category)
        assert_response :success
    end
     
 end