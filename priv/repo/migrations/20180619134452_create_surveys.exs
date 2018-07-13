defmodule Database.Repo.Migrations.CreateSurveys do
  use Ecto.Migration

  def change do
    create table(:surveys) do
      add :event_attended, :boolean, default: false, null: false
      add :met_someone, :boolean, default: false, null: false
      add :person_id, references(:persons, on_delete: :nothing)

      timestamps()
    end

    create index(:surveys, [:person_id])
  end
end
