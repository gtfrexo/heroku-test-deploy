defmodule Database.Surveys.Survey do
  use Ecto.Schema
  import Ecto.Changeset


  schema "surveys" do
    field :event_attended, :boolean, default: false
    field :met_someone, :boolean, default: false
    field :person_id, :id

    timestamps()
  end

  @doc false
  def changeset(survey, attrs) do
    survey
    |> cast(attrs, [:event_attended, :met_someone, :person_id])
    |> validate_required([:event_attended, :met_someone, :person_id])
  end
end
