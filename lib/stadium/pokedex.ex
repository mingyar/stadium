defmodule Stadium.Pokedex do
  @moduledoc """
  Responsible to process and manage all data regarding PokeAPI
  """
  use HTTPoison.Base

  @expected_fields ~w(
    name url
  )

  def process_request_url(url) do
    "https://pokeapi.co/api/v2/" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  def get_pokemon(id) do
    start
    get!("pokemon/#{id}").body[:name]
  end
end
