defmodule Database.Venues.Venue do
  use Ecto.Schema
  import Ecto.Changeset


  schema "venues" do
    field :category, :string
    field :description, :string
    field :name, :string
    field :name_full, :string
    field :location_id, :id
    field :pic, :id

    has_many :events, Database.Events.Event
    has_many :hosts, Database.Hosts.Host
    has_many :images, Database.Medias.Media

    timestamps()
  end

  @doc false
  def changeset(venue, attrs) do
    venue
    |> cast(attrs, [:category, :description, :events_created, :name, :name_full, :location_id, :pic])
    |> validate_required([:category, :description, :events_created, :name, :name_full, :location_id, :pic])
  end
end
