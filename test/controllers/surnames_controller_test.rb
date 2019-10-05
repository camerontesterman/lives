require 'test_helper'

class SurnamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @surname = surnames(:one)
  end

  test "should get index" do
    get surnames_url
    assert_response :success
  end

  test "should get new" do
    get new_surname_url
    assert_response :success
  end

  test "should create surname" do
    assert_difference('Surname.count') do
      post surnames_url, params: { surname: { language_id: @surname.language_id } }
    end

    assert_redirected_to surname_url(Surname.last)
  end

  test "should show surname" do
    get surname_url(@surname)
    assert_response :success
  end

  test "should get edit" do
    get edit_surname_url(@surname)
    assert_response :success
  end

  test "should update surname" do
    patch surname_url(@surname), params: { surname: { language_id: @surname.language_id } }
    assert_redirected_to surname_url(@surname)
  end

  test "should destroy surname" do
    assert_difference('Surname.count', -1) do
      delete surname_url(@surname)
    end

    assert_redirected_to surnames_url
  end
end
