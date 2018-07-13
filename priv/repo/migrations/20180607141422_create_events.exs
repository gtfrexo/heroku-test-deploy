defmodule Database.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :person_id, :id
      add :location_id, :id 
      add :media_id, :id
      add :category, :string
      add :description, :string
      add :end_time, :utc_datetime
      add :event_clicked, :integer
      add :pool_clicked, :integer
      add :start_time, :utc_datetime
      add :title, :string
      add :title_full, :string

      timestamps()
    end

  end
end
