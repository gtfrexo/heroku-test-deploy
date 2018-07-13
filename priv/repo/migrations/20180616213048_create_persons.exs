defmodule Database.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :birthday, :utc_datetime
      add :email, :string
      add :gender_id, :id
      add :name, :string
      add :name_full, :string
      add :target_gender, :string
      add :target_relationship, :string
      add :token, :string
      add :id_token, :string
      add :auth_token, :string
      add :email_verified, :boolean
      add :profile_content_id, :id
      add :profile_pic, :id
      add :auth0_me_id, :string
      add :bio, :string

      timestamps()
    end

  end
end
