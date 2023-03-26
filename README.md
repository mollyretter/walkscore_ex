# WalkscoreEx

An Elixir API client for the WalkScore API.

## Installation

This hex package can be installed by adding `walkscore_ex` to your list of dependencies in `mix.exs`:

### mix.exs
```elixir
def deps do
  [
    {:walkscore_ex, "~> 0.0.1"}
  ]
end
```

### config.exs
```elixir
config :walkscore_ex, walkscore_api_key: "YOUR_API_KEY_FROM_WALKSCORE"
```

## Example

### Sample Request
```
latitude = "38.897675"
longitude = "-77.036547"
address = "1600 Pennsylvania Avenue NW, Washington, DC, USA"

response = WalkscoreEx.get_score(latitude, longitude, address)
```

### Sample Response
```
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

## Documentation

### Local
Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc) by running `mix docs`. To view the docs locally, make sure you have the latest NPM install and run `npx serve doc/`.

### Hex Docs
The docs can be found here on [HexDocs](https://hexdocs.pm/walkscore_ex).