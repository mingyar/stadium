defmodule StadiumWeb.BattleController do
  use StadiumWeb, :controller
  alias Stadium.Battles
  alias Stadium

  def create(conn, %{"pokemon_id_1" => pokemon_id_1, "pokemon_id_2" => pokemon_id_2}) do
    battle = Stadium.set_up_battle(pokemon_id_1, pokemon_id_2)
    with {:ok, battle} <- Battles.create_battle(battle) do
      render(conn, "create.json", battle: battle)
    end
  end

  @doc """
  Ask Stadium to set up a new battle, store the battle and render the new battle created.
  """
  def create(conn, _params) do
    battle = Stadium.set_up_battle
    with {:ok, battle} <- Battles.create_battle(battle) do
      render(conn, "create.json", battle: battle)
    end
  end

  @doc """
  Ask Battle repository to get the chosen battle by given id and render it.
  """
  def show(conn, %{"id" => battle_id}) do
    battle = Battles.get_battle(battle_id)
    render(conn, "show.json", battle: battle)
  end

  @doc """
  Ask Battle repository to get all battles to render them.
  """
  def index(conn, _params) do
    all_battles = Battles.get_all
    render(conn, "index.json", %{battles: all_battles})
  end
end
