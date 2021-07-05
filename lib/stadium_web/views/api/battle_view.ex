defmodule StadiumWeb.BattleView do
  @moduledoc """
  Renders Battle structs in a given format.
  """
  use StadiumWeb, :view

  @doc """
  Renders created Battle information in JSON format.
  """
  def render("create.json", %{battle: battle}) do
    %{
      oppenents: "#{battle.pokemon_1} X #{battle.pokemon_2}",
      the_winner_is: battle.winner,
      url: battle_url(battle)
    }
  end

  @doc """
  Renders a list of Battles in JSON format.
  """
  def render("index.json", %{battles: battles}) do
    %{
      battles: Enum.map(battles, fn(battle) -> battle_json_list_item(battle) end)
    }
  end

  @doc """
  Renders a Battle in JSON format.
  """
  def render("show.json", %{battle: battle}) do
    %{
      battle: battle_json(battle)
    }
  end

  defp battle_json(battle) do
    %{
      id: battle.id,
      pokemon_1: battle.pokemon_1,
      pokemon_2: battle.pokemon_2,
      winner: battle.winner
    }
  end

  defp battle_json_list_item(battle) do
    %{
      battle: battle_json(battle),
      url: battle_url(battle)
    }
  end

  defp battle_url(battle) do
    StadiumWeb.Endpoint.url <> "/api/battle/#{battle.id}"
  end

end
