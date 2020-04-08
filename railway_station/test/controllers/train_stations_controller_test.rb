require 'test_helper'

class TrainStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @train_station = train_stations(:one)
  end

  test "should get index" do
    get train_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_train_station_url
    assert_response :success
  end

  test "should create train_station" do
    assert_difference('TrainStation.count') do
      post train_stations_url, params: { train_station: { title: @train_station.title } }
    end

    assert_redirected_to train_station_url(TrainStation.last)
  end

  test "should show train_station" do
    get train_station_url(@train_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_train_station_url(@train_station)
    assert_response :success
  end

  test "should update train_station" do
    patch train_station_url(@train_station), params: { train_station: { title: @train_station.title } }
    assert_redirected_to train_station_url(@train_station)
  end

  test "should destroy train_station" do
    assert_difference('TrainStation.count', -1) do
      delete train_station_url(@train_station)
    end

    assert_redirected_to train_stations_url
  end
end
