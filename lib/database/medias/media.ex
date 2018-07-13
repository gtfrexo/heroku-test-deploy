defmodule Database.Medias.Media do
  use Ecto.Schema
  import Ecto.Changeset


  schema "medias" do
    field :deleted_at, :utc_datetime
    field :description, :string
    field :media_type, :string
    field :url, :string
    field :venue_id, :id 
    field :event_id, :id

    timestamps()
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [:deleted_at, :description, :media_type, :url, :venue_id, :event_id])
    |> validate_required([:deleted_at, :description, :media_type, :url, :venue_id, :event_id])
  end
end
