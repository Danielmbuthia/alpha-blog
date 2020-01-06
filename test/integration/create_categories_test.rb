require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
    test "get category new form and post a category" do
        get new_category_path 
        assert_template 'categories/new'  
        assert_difference "Category.count", 1 do
          post categories_path, params:{category:{name: "sport"}}
        end
        # assert_template 'categories/index'
        # assert_match 'sport', response.body
    end
    test "invalid category form submission" do
        get new_category_path 
        assert_template 'categories/new'  
        assert_no_difference "Category.count" do
          post categories_path, params:{category:{name: " "}}
        end
        assert_template 'categories/new'  
        assert_select 'h2.card-title'
        assert_select 'div.card-body'
    end
end