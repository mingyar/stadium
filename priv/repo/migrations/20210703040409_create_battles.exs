defmodule Stadium.Repo.Migrations.CreateBattles do
  use Ecto.Migration

  def change do
    create table(:battles) do
      add :pokemon_1, :string
      add :pokemon_2, :string
      add :winner, :string

      timestamps()
    end

  end
end
