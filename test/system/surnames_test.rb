require "application_system_test_case"

class SurnamesTest < ApplicationSystemTestCase
  setup do
    @surname = surnames(:one)
  end

  test "visiting the index" do
    visit surnames_url
    assert_selector "h1", text: "Surnames"
  end

  test "creating a Surname" do
    visit surnames_url
    click_on "New Surname"

    fill_in "Language", with: @surname.language_id
    click_on "Create Surname"

    assert_text "Surname was successfully created"
    click_on "Back"
  end

  test "updating a Surname" do
    visit surnames_url
    click_on "Edit", match: :first

    fill_in "Language", with: @surname.language_id
    click_on "Update Surname"

    assert_text "Surname was successfully updated"
    click_on "Back"
  end

  test "destroying a Surname" do
    visit surnames_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Surname was successfully destroyed"
  end
end
