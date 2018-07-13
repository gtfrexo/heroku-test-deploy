defmodule Database.Repo.Migrations.CreateContextvals do
  use Ecto.Migration

  def change do
    create table(:contextvals) do
      add :education_blurb, :string
      add :occupation_blurb, :string
      add :boat_blurb, :string
      add :eggs_blurb, :string
      add :animal_blurb, :string
      add :worst_pickup_blurb, :string
      add :emoji_blurb, :string

      timestamps()
    end

  end
end
