defmodule Database.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset


  schema "events" do
    field :category, :string
    field :description, :string
    field :end_time, :utc_datetime
    field :start_time, :utc_datetime
    field :title, :string
    field :title_full, :string
    field :created_by, :id
    field :location_id, :id 
    field :pic, :id
    field :host_id, :id
    field :created_at, :utc_datetime
    field :pool_id, :id

    has_many :images, Database.Medias.Media
    has_many :venues, Database.Venues.Venue

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:category, :description, :end_time, :start_time, :title, :title_full, :created_by, :location_id, :pic, :host_id, :created_at, :pool_id])
    |> validate_required([:category, :description, :end_time, :start_time, :title, :title_full, :created_by, :location_id, :pic, :host_id, :created_at, :pool_id])
  end
end
