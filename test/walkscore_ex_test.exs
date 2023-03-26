defmodule WalkscoreExTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    :ok
  end

  test "get_score" do
    latitude = "33.961890"
    longitude = "-118.367380"
    address = "621 West Manchester Blvd, Inglewood, CA 90301 USA"

    use_cassette "walkscore_request_manchester" do
      response = WalkscoreEx.get_score(latitude, longitude, address)

      assert response == %{
               "description" => "Very Walkable",
               "help_link" => "https://www.redfin.com/how-walk-score-works",
               "logo_url" => "https://cdn.walk.sc/images/api-logo.png",
               "more_info_icon" => "https://cdn.walk.sc/images/api-more-info.gif",
               "more_info_link" => "https://www.redfin.com/how-walk-score-works",
               "snapped_lat" => 33.9615,
               "snapped_lon" => -118.368,
               "status" => 1,
               "updated" => "2023-02-15 17:15:11.840515",
               "walkscore" => 87,
               "ws_link" =>
                 "https://www.walkscore.com/score/621-West-Manchester-Blvd-Inglewood-CA-90301-USA/lat=33.961890/lng=-118.367380/?utm_source=test.com&utm_medium=ws_api&utm_campaign=ws_api"
             }
    end
  end

  test "format_url" do
    latitude = "33.961890"
    longitude = "-118.367380"
    address = "621 West Manchester Blvd, Inglewood, CA 90301 USA"
    fake_api_key = "4k525khk5k6k5k72"
    response = WalkscoreEx.format_url(latitude, longitude, address, fake_api_key)

    assert response ==
             "https://api.walkscore.com/score?format=json&wsapikey=4k525khk5k6k5k72&address=621%20West%20Manchester%20Blvd,%20Inglewood,%20CA%2090301%20USA&lat=33.961890&lon=-118.367380"
  end
end
