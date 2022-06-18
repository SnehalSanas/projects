require "application_system_test_case"

class V1::VillasTest < ApplicationSystemTestCase
  setup do
    @v1_villa = v1_villas(:one)
  end

  test "visiting the index" do
    visit v1_villas_url
    assert_selector "h1", text: "V1/Villas"
  end

  test "creating a Villa" do
    visit v1_villas_url
    click_on "New V1/Villa"

    click_on "Create Villa"

    assert_text "Villa was successfully created"
    click_on "Back"
  end

  test "updating a Villa" do
    visit v1_villas_url
    click_on "Edit", match: :first

    click_on "Update Villa"

    assert_text "Villa was successfully updated"
    click_on "Back"
  end

  test "destroying a Villa" do
    visit v1_villas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Villa was successfully destroyed"
  end
end
