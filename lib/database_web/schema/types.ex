defmodule DatabaseWeb.Schema.Types do

    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Database.Repo
    import_types(Absinthe.Type.Custom)
    

    object :person do
        
        field :id, :id 
        field :birthday, :datetime
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
        field :profile_content, :profile_content, resolve: assoc(:profile_content)
        field :profile_pic, :media, resolve: assoc(:media)
        field :auth0_me_id, :string
        field :bio, :string
        field :currently_blocking, list_of(:person), resolve: assoc(:persons)
        field :created_events, list_of(:event), resolve: assoc(:events)
        field :blocked_by, list_of(:person), resolve: assoc(:persons)
        field :sent_messages, list_of(:message), resolve: assoc(:messages)
        field :recieved_messages, list_of(:message), resolve: assoc(:messages)
        field :chatting_with, list_of(:person), resolve: assoc(:persons)
        field :interested_pools, list_of(:pool), resolve: assoc(:pools)
        field :viewed_pools, list_of(:pool), resolve: assoc(:pools)
        field :attending_pools, list_of(:pool), resolve: assoc(:pools)
        field :images, list_of(:media), resolve: assoc(:medias)

    end

    object :location do
        
        field :id, :id 
        field :address, :string
        field :address_full, :string
        field :city, :string
        field :country, :string
        field :lat, :float
        field :lon, :float
        field :state, :string
        field :zip, :string
        #field :event_locations, list_of(:location)

    end

    object :media do
        
        field :id, :id 
        field :deleted_at, :datetime
        field :description, :string
        field :media_type, :string
        field :url, :string
        field :venue, :venue, resolve: assoc(:venue)
        field :event, :event, resolve: assoc(:event)

    end

    object :venue do
        
        field :id, :id 
        field :category, :string
        field :description, :string
        field :name, :string
        field :name_full, :string
        field :location, :location, resolve: assoc(:location)
        field :pic, :media, resolve: assoc(:media)
        field :events, list_of(:event), resolve: assoc(:events)
        field :hosts, list_of(:host), resolve: assoc(:hosts)
        field :images, list_of(:media), resolve: assoc(:medias)

    end

    object :event do
        
        field :id, :id 
        field :created_by, :person, resolve: assoc(:person)
        field :location, :location, resolve: assoc(:location)
        field :pic, :media, resolve: assoc(:media)
        field :category, :string
        field :description, :string
        field :end_time, :datetime
        field :start_time, :datetime
        field :title, :string
        field :title_full, :string
        field :created_at, :datetime
        field :pool, :pool, resolve: assoc(:pool)
        field :host, :host, resolve: assoc(:host)
        field :images, list_of(:media), resolve: assoc(:medias)
        field :venues, list_of(:venue), resolve: assoc(:venues)

    end

    object :host do
        
        field :id, :id 
        field :description, :string
        field :name, :string
        field :name_full, :string
        field :venue, :venue, resolve: assoc(:venue)

    end

    object :pool do
        
        field :id, :id 
        field :event, :event, resolve: assoc(:event)
        field :seatgeek_id, :string
        field :eventbrite_id, :string
        field :interested_persons, list_of(:person), resolve: assoc(:persons)
        field :attending_persons, list_of(:person), resolve: assoc(:persons)
        field :viewed_persons, list_of(:person), resolve: assoc(:persons)

    end

    object :message do
        
        field :id, :id 
        field :content, :string
        field :read_at, :datetime
        field :from_person, :person, resolve: assoc(:person)
        field :to_person, :person, resolve: assoc(:person)
        field :sent_at, :datetime

    end

    object :survey do
        
        field :id, :id 
        field :person, :person, resolve: assoc(:person)
        field :event_attended, :boolean
        field :met_someone, :boolean

    end

    object :pals do
        
        field :id, :id 
        field :events_created, :integer
        field :messages_total, :integer
        field :pools_joined, :integer
        field :started_chats, :integer

    end

    object :pass do
        
        field :id, :id 
        field :events_created, :integer
        field :messages_recieved, :integer
        field :messages_sent, :integer
        field :pools_joined, :integer
        field :started_chats, :integer
        field :age, :integer
        field :person, :person, resolve: assoc(:person)

    end

    object :context_val do
        
        field :id, :id 
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :emoji_blurb, :string

    end

    object :profile_content do
        
        field :id, :id 
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :emoji_blurb, :string
        field :person, :person, resolve: assoc(:person)

    end

    object :gals do
        
        field :id, :id 
        field :created_events, :integer
        field :event_clicked, :integer
        field :influenced_chats, :integer
        field :pool_clicked, :integer

    end

    object :version do

        field :id, :id
        field :current_version, :string
        field :target_version, :string

    end

end