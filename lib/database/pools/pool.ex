defmodule Database.Pools.Pool do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pools" do
    field :event_id, :id
    field :seatgeek_id, :string
    field :eventbrite_id, :string

    has_many :interested_persons, Database.Persons.Person
    has_many :attending_persons, Database.Persons.Person
    has_many :viewed_persons, Database.Persons.Person

    timestamps()
  end

  @doc false
  def changeset(pool, attrs) do
    pool
    |> cast(attrs, [:event_id, :seatgeek_id, :eventbrite_id])
    |> validate_required([:event_id, :seatgeek_id, :eventbrite_id])
  end
end
