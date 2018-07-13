defmodule Database.Repo.Migrations.CreateMedias do
  use Ecto.Migration

  def change do
    create table(:medias) do
      add :deleted_at, :utc_datetime
      add :description, :string
      add :media_type, :string
      add :url, :string

      timestamps()
    end

  end
end
