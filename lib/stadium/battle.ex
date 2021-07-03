defmodule Stadium.Battle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "battles" do
    field :pokemon_1, :string
    field :pokemon_2, :string
    field :winner, :string

    timestamps()
  end

  @doc false
  def changeset(battle, attrs) do
    battle
    |> cast(attrs, [:pokemon_1, :pokemon_2, :winner])
    |> validate_required([:pokemon_1, :pokemon_2, :winner])
  end
end
