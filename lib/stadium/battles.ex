defmodule Stadium.Battles do
  import Ecto.Changeset
  alias Stadium.Battle
  alias Stadium.Repo

  def get_all do
    Repo.all(Battle)
  end

  def get_battle(battle_id) do
    Repo.get(Battle, battle_id)
  end

  def create_battle(params) do
    register_changeset(params)
    |> Repo.insert
  end

  def register_changeset(params \\ %{}) do
    %Battle{}
    |> cast(params, [:pokemon_1, :pokemon_2, :winner])
  end
end
