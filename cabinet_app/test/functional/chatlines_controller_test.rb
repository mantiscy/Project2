require 'test_helper'

class ChatlinesControllerTest < ActionController::TestCase
  setup do
    @chatline = chatlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chatlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chatline" do
    assert_difference('Chatline.count') do
      post :create, chatline: { email: @chatline.email, message: @chatline.message }
    end

    assert_redirected_to chatline_path(assigns(:chatline))
  end

  test "should show chatline" do
    get :show, id: @chatline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chatline
    assert_response :success
  end

  test "should update chatline" do
    put :update, id: @chatline, chatline: { email: @chatline.email, message: @chatline.message }
    assert_redirected_to chatline_path(assigns(:chatline))
  end

  test "should destroy chatline" do
    assert_difference('Chatline.count', -1) do
      delete :destroy, id: @chatline
    end

    assert_redirected_to chatlines_path
  end
end
