defmodule Database.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :read_at, :utc_datetime
      add :from_person, :id
      add :to_person, :id
      add :sent_at, :utc_datetime

      timestamps()
    end

  end
end
