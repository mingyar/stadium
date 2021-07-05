defmodule Stadium do
  alias Stadium.Pokedex
  @moduledoc """
  Stadium keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @doc """
  Results a random pokemon id.
  Determine who is the Pokemon that is up to batlle.
  """
  def whos_that_pokemon do
    pokedex_index = 1..900 |> Enum.random
  end

  @doc """
  Gets pokemon name from Pokedex.
  """
  def get_pokemon_name do
    whos_that_pokemon
    |> Pokedex.get_pokemon
  end

  @doc """
  Set up a Pakemon Battle.
  """
  def set_up_battle do
    prepare_to_battle |> the_winner_is
  end

  @doc """
  Set up a Pakemon Battle.
  """
  def set_up_battle(pokemon_id_1, pokemon_id_2) do
    prepare_to_battle(pokemon_id_1, pokemon_id_2) |> the_winner_is
  end

  @doc """
  Determine who is the winner.
  """
  defp who_win(pokemons) do
    winner = 0..1 |> Enum.random
    pokemons |> Enum.at(winner)
  end

  defp the_winner_is(pokemons) do
    winner = who_win(pokemons)

    %{
      pokemon_1: Enum.at(pokemons, 0),
      pokemon_2: Enum.at(pokemons, 1),
      winner: winner
    }
  end

  defp prepare_to_battle do
    [get_pokemon_name, get_pokemon_name]
  end

  defp prepare_to_battle(pokemon_id_1, pokemon_id_2) do
    [
      Pokedex.get_pokemon(pokemon_id_1),
      Pokedex.get_pokemon(pokemon_id_2)
    ]
  end
end
