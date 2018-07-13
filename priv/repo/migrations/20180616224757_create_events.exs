defmodule Database.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :category, :string
      add :description, :string
      add :end_time, :utc_datetime
      add :start_time, :utc_datetime
      add :title, :string
      add :title_full, :string
      add :created_by, :id 
      add :location_id, :id 
      add :pic, :id 
      add :created_at, :utc_datetime
      add :pool_id, :id
      add :host_id, :id

      timestamps()
    end

  end
end
