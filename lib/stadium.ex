defmodule Stadium do
  alias Stadium.Pokedex
  @moduledoc """
  Stadium keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def whos_that_pokemon do
    pokedex_index = 1..900 |> Enum.random
  end

  def get_pokemon_name do
    whos_that_pokemon
    |> Pokedex.get_pokemon
  end

  def set_up_battle do
    pokemon_1 = get_pokemon_name
    pokemon_2 = get_pokemon_name
    winner = who_win([pokemon_1, pokemon_2])

    %{pokemon_1: pokemon_1, pokemon_2: pokemon_2, winner: winner}
  end

  def who_win(pokemons) do
    winner = 0..1 |> Enum.random
    pokemons |> Enum.at(winner)
  end
end
