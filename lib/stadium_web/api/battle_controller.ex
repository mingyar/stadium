defmodule StadiumWeb.BattleController do
  use StadiumWeb, :controller
  alias Stadium.Battles
  alias Stadium

  def create(conn, _params) do
    battle = Stadium.set_up_battle
    {:ok, battle} = Battles.create_battle(battle)
    render(conn, "create.json", battle: battle)
  end

  def show(conn, %{"id" => battle_id}) do
    battle = Battles.get_battle(battle_id)
    render(conn, "show.json", battle: battle)
  end

  def index(conn, _params) do
    all_battles = Battles.get_all
    render(conn, "index.json", %{battles: all_battles})
  end
end
