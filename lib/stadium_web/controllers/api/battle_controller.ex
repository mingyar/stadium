defmodule StadiumWeb.BattleController do
  use StadiumWeb, :controller
  alias Stadium.Battles
  alias Stadium

  @doc """
  Ask Stadium to set up a new battle, by *given two pokemon ids*,
  store the battle and render the new battle created.

  ## Parameters

    - *pokemon_id_1*: First Pokemon id on https://pokeapi.co/api/v2/pokemon/
    - *pokemon_id_2*: Second Pokemon id on https://pokeapi.co/api/v2/pokemon/

  ## Example
    By hitting a POST against:
    http://localhost:4000/api/battle/create?pokemon_id_1=8&pokemon_id_2=10

    It will return a JSON as follows:
    ```
    {
      "oppenents":"wartortle X caterpie",
      "the_winner_is":"wartortle",
      "url":"http://localhost:4000/api/battle/42"
    }
    ```
  """
  def create(conn, %{"pokemon_id_1" => pokemon_id_1, "pokemon_id_2" => pokemon_id_2}) do
    battle = Stadium.set_up_battle(pokemon_id_1, pokemon_id_2)
    with {:ok, battle} <- Battles.create_battle(battle) do
      render(conn, "create.json", battle: battle)
    end
  end

  @doc """
  Creates a new Battle *with random pokemons*,
  store the battle and render the new battle created.
  """
  def create(conn, _params) do
    battle = Stadium.set_up_battle
    with {:ok, battle} <- Battles.create_battle(battle) do
      render(conn, "create.json", battle: battle)
    end
  end

  @doc """
  Ask Battle repository to get the chosen battle by given id and render it.

  ## Example
    By hitting a GET against:
    http://localhost:4000/api/battle/12

    It will return a JSON as follows:
    ```
    {
      "battle": {
        "id": 12,
        "pokemon_1": "shroomish",
        "pokemon_2": "urshifu-single-strike",
        "winner": "shroomish"
      }
    }
    ```
  """
  def show(conn, %{"id" => battle_id}) do
    battle = Battles.get_battle(battle_id)
    render(conn, "show.json", battle: battle)
  end

  @doc """
  Ask Battle repository to get all battles to render them.

  ## Example
    By hitting a GET against:
    http://localhost:4000/api/battles

    It will return a JSON as follows:
    ```
    {
    "battles": [
        {
            "battle": {
                "id": 4,
                "pokemon_1": "kabutops",
                "pokemon_2": "deoxys-normal",
                "winner": "kabutops"
            },
            "url": "http://localhost:4000/api/battle/4"
        },
        {
            "battle": {
                "id": 5,
                "pokemon_1": "tyrantrum",
                "pokemon_2": "swablu",
                "winner": "tyrantrum"
            },
            "url": "http://localhost:4000/api/battle/5"
        }
      ]
    }
    ```
  """
  def index(conn, _params) do
    all_battles = Battles.get_all
    render(conn, "index.json", %{battles: all_battles})
  end
end
