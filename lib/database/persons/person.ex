defmodule Database.Persons.Person do
  use Ecto.Schema
  import Ecto.Changeset


  schema "persons" do
    field :birthday, :utc_datetime
    field :email, :string
    field :gender_id, :id 
    field :name, :string
    field :name_full, :string
    field :target_gender, :string
    field :target_relationship, :string
    field :token, :string
    field :id_token, :string
    field :auth_token, :string
    field :email_verified, :boolean
    field :profile_content_id, :id
    field :profile_pic, :id
    field :auth0_me_id, :string
    field :bio, :string

    has_many :currently_blocking, Database.Persons.Person
    has_many :blocked_by, Database.Persons.Person
    has_many :created_events, Database.Events.Event
    has_many :sent_messages, Database.Messages.Message
    has_many :recieved_messages, Database.Messages.Message
    has_many :chatting_with, Database.Persons.Person
    has_many :interested_pools, Database.Pools.Pool
    has_many :viewed_pools, Database.Pools.Pool
    has_many :attending_pools, Database.Pools.Pool
    has_many :images, Database.Medias.Media

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:birthday, :email, :gender_id, :name, :name_full, :target_gender, :target_relationship, :token, :id_token, :auth_token, :email_verified, :profile_content_id, :profile_pic, :auth0_me_id, :bio])
    |> validate_required([:birthday, :email, :gender_id, :name, :name_full, :target_gender, :target_relationship, :token, :id_token, :auth_token, :email_verified, :profile_content_id, :profile_pic, :auth0_me_id, :bio])
  end
end
