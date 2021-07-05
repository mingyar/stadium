defmodule StadiumWeb.BattleController do
  use StadiumWeb, :controller
  alias Stadium.Battles
  alias Stadium

  action_fallback StadiumWeb.FallbackController

  def create(conn, _params) do
    battle = Stadium.set_up_battle
    with {:ok, battle} <- Battles.create_battle(battle) do
      render(conn, "create.json", battle: battle)
    end
  end

  def show(conn, %{"id" => battle_id}) do
    with {battle} <- Battles.get_battle(battle_id) do
      render(conn, "show.json", battle: battle)
    end
  end

  def index(conn, _params) do
    all_battles = Battles.get_all
    render(conn, "index.json", %{battles: all_battles})
  end
end
