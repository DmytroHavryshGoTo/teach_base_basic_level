require "application_system_test_case"

class TrainStationsTest < ApplicationSystemTestCase
  setup do
    @train_station = train_stations(:one)
  end

  test "visiting the index" do
    visit train_stations_url
    assert_selector "h1", text: "Train Stations"
  end

  test "creating a Train station" do
    visit train_stations_url
    click_on "New Train Station"

    fill_in "Title", with: @train_station.title
    click_on "Create Train station"

    assert_text "Train station was successfully created"
    click_on "Back"
  end

  test "updating a Train station" do
    visit train_stations_url
    click_on "Edit", match: :first

    fill_in "Title", with: @train_station.title
    click_on "Update Train station"

    assert_text "Train station was successfully updated"
    click_on "Back"
  end

  test "destroying a Train station" do
    visit train_stations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Train station was successfully destroyed"
  end
end
