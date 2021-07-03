defmodule StadiumWeb.BattleView do
  use StadiumWeb, :view

  def render("index.json", %{battles: battles}) do
    %{
      battles: Enum.map(battles, fn(battle) -> battle_json(battle) end)
    }
  end

  def render("show.json", %{battle: battle}) do
    %{
      battle: battle_json(battle)
    }
  end

  def battle_json(battle) do
    %{
      id: battle.id,
      pokemon_1: battle.pokemon_1,
      pokemon_2: battle.pokemon_2,
      winner: battle.winner
    }
  end
end
