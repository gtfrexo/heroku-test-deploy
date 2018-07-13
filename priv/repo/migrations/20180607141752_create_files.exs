defmodule Database.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :content_type, :string
      add :name, :string
      add :name_full, :string
      add :secret, :string
      add :size, :integer
      add :url, :string

      timestamps()
    end

  end
end
