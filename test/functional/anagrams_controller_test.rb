require 'test_helper'

class AnagramsControllerTest < ActionController::TestCase
  setup do
    @anagram = anagrams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anagrams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anagram" do
    assert_difference('Anagram.count') do
      post :create, anagram: @anagram.attributes
    end

    assert_redirected_to anagram_path(assigns(:anagram))
  end

  test "should show anagram" do
    get :show, id: @anagram
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anagram
    assert_response :success
  end

  test "should update anagram" do
    put :update, id: @anagram, anagram: @anagram.attributes
    assert_redirected_to anagram_path(assigns(:anagram))
  end

  test "should destroy anagram" do
    assert_difference('Anagram.count', -1) do
      delete :destroy, id: @anagram
    end

    assert_redirected_to anagrams_path
  end
end
