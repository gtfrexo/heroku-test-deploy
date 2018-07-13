defmodule Database.Repo.Migrations.CreateVenues do
  use Ecto.Migration

  def change do
    create table(:venues) do
      add :category, :string
      add :description, :string
      add :events_created, :integer
      add :name, :string
      add :name_full, :string
      add :location, :id

      timestamps()
    end

  end
end
