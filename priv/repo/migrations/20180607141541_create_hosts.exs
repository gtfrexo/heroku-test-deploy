defmodule Database.Repo.Migrations.CreateHosts do
  use Ecto.Migration

  def change do
    create table(:hosts) do
      add :created_events, :integer
      add :description, :string
      add :name, :string
      add :name_full, :string

      timestamps()
    end

  end
end
