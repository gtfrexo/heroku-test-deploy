defmodule Database.Repo.Migrations.CreatePools do
  use Ecto.Migration

  def change do
    create table(:pools) do
      add :event_id, :id 
      add :seatgeek_id, :string
      add :eventbrite_id, :string

      timestamps()
    end

  end
end
