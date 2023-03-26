defmodule WalkscoreEx do
  @moduledoc """
  This is an Elixir client for the [WalkScore API](https://www.walkscore.com/professional/api.php).

  Make sure you add `walkscore_ex` to your mix.exs and then run `mix deps.get`.
  ```elixir
    def deps do
      [
        {:walkscore_ex, "~> 0.0.1"}
      ]
    end
  ```

  In order to use WalkscoreEx, you must register and receive an API key from WalkScore
  and save that value in your config, eg:

  ```elixir
  config :walkscore_ex, walkscore_api_key: "YOUR_API_KEY_FROM_WALKSCORE"
  ```
  """

  @base_walkscore_api_url "https://api.walkscore.com/score?format=json"
  @walk_api_key Application.get_env(:walkscore_ex, :walkscore_api_key)

  @doc """
  This method accepts the string parameters latitude, longitude, and address.
  It makes an API call to the WalkScore API and returns a decoded JSON response.

  ## Examples
  ```elixir
    # params
    latitude = "38.897675"
    longitude = "-77.036547"
    address = "1600 Pennsylvania Avenue NW, Washington, DC, USA"

    # API call
    response = WalkscoreEx.get_score(latitude, longitude, address)

    # value of `response`
    %{
      "description" => "Very Walkable",
      "help_link" => "https://www.redfin.com/how-walk-score-works",
      "logo_url" => "https://cdn.walk.sc/images/api-logo.png",
      "more_info_icon" => "https://cdn.walk.sc/images/api-more-info.gif",
      "more_info_link" => "https://www.redfin.com/how-walk-score-works",
      "snapped_lat" => 38.898,
      "snapped_lon" => -77.037,
      "status" => 1,
      "updated" => "2023-02-13 03:39:18.898986",
      "walkscore" => 83,
      "ws_link" => "https://www.walkscore.com/score/1600-Pennsylvania-Avenue-NW-Washington-DC-USA/lat=38.897675/lng=-77.036547"
    }
  ```
  """
  def get_score(latitude, longitude, address) do
    walkscore_url = format_url(latitude, longitude, address, @walk_api_key)
    HTTPoison.start()
    response = HTTPoison.get!(walkscore_url)
    Poison.decode!(response.body)
  end

  def format_url(lat, lon, address, api_key) do
    URI.encode(
      "#{@base_walkscore_api_url}&wsapikey=#{api_key}&address=#{address}&lat=#{lat}&lon=#{lon}"
    )
  end
end
