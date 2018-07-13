defmodule DatabaseWeb.Schema do
    
    use Absinthe.Schema
    import_types DatabaseWeb.Schema.Types
    #import_types(Absinthe.Type.Custom)

    query do
        
        ##LIST ALL QUERY##

        field :persons, list_of(:person) do
            resolve &Database.PersonResolver.all/2
        end

        field :locations, list_of(:location) do
            resolve &Database.LocationResolver.all/2
        end

        field :medias, list_of(:media) do
            resolve &Database.MediaResolver.all/2
        end

        field :venues, list_of(:venue) do
            resolve &Database.VenueResolver.all/2
        end

        field :events, list_of(:event) do
            resolve &Database.EventResolver.all/2
        end

        field :hosts, list_of(:host) do
            resolve &Database.HostResolver.all/2
        end

        field :pools, list_of(:pool) do
            resolve &Database.PoolResolver.all/2
        end

        field :messages, list_of(:message) do
            resolve &Database.MessageResolver.all/2
        end

        field :surveys, list_of(:survey) do
            resolve &Database.SurveyResolver.all/2
        end 

        field :palss, list_of(:pals) do
            resolve &Database.PalsResolver.all/2
        end

        field :passs, list_of(:pass) do
            resolve &Database.PassResolver.all/2
        end

        field :context_vals, list_of(:context_val) do
            resolve &Database.ContextValResolver.all/2
        end

        field :profile_contents, list_of(:profile_content) do
            resolve &Database.ProfileContentResolver.all/2
        end

        field :galss, list_of(:gals) do
            resolve &Database.GalsResolver.all/2
        end

        field :versions, list_of(:version) do
            resolve &Database.VersionResolver.all/2
        end

        ##FIND ONE QUERY##

        field :person, type: :person do
            arg :id, non_null(:id)
            resolve &Database.PersonResolver.find/2
        end

        field :location, type: :location do
            arg :id, non_null(:id)
            resolve &Database.LocationResolver.find/2
        end

        field :media, type: :media do
            arg :id, non_null(:id)
            resolve &Database.MediaResolver.find/2
        end

        field :venue, type: :venue do
            arg :id, non_null(:id)
            resolve &Database.VenueResolver.find/2
        end

        field :event, type: :event do
            arg :id, non_null(:id)
            resolve &Database.EventResolver.find/2
        end

        field :host, type: :host do
            arg :id, non_null(:id)
            resolve &Database.HostResolver.find/2
        end

        field :pool, type: :pool do
            arg :id, non_null(:id)
            resolve &Database.PoolResolver.find/2
        end

        field :message, type: :message do
            arg :id, non_null(:id)
            resolve &Database.MessageResolver.find/2
        end

        field :survey, type: :survey do
            arg :id, non_null(:id)
            resolve &Database.SurveyResolver.find/2
        end

        field :pals, type: :pals do
            arg :id, non_null(:id)
            resolve &Database.PalsResolver.find/2
        end

        field :pass, type: :pass do
            arg :id, non_null(:id)
            resolve &Database.PassResolver.find/2
        end

        field :context_val, type: :context_val do
            arg :id, non_null(:id)
            resolve &Database.ContextValResolver.find/2
        end

        field :profile_content, type: :profile_content do
            arg :id, non_null(:id)
            resolve &Database.ProfileContentResolver.find/2
        end

        field :gals, type: :gals do
            arg :id, non_null(:id)
            resolve &Database.GalsResolver.find/2
        end

        field :version, type: :version do
            arg :id, non_null(:id)
            resolve &Database.VersionResolver.find/2
        end

    end

    ##UPDATE PARAMS##

    input_object :update_person_params do
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
        field :profile_content_id, :id
        field :profile_pic, :id
        field :auth0_me_id, :string
        field :bio, :string
    end

    input_object :update_location_params do
        field :address, :string
        field :address_full, :string
        field :city, :string
        field :country, :string
        field :lat, :float
        field :lon, :float
        field :state, :string
        field :zip, :string
    end

    input_object :update_media_params do
        field :deleted_at, :datetime
        field :description, :string
        field :media_type, :string
        field :url, :string
        field :venue_id, :id 
        field :event_id, :id
    end

    input_object :update_venue_params do
        field :category, :string
        field :description, :string
        field :name, :string
        field :name_full, :string
        field :location, :id
        field :pic, :id
    end

    input_object :update_event_params do
        field :created_by, :id
        field :location_id, :id
        field :pic, :id
        field :category, :string
        field :description, :string
        field :end_time, :datetime
        field :start_time, :datetime
        field :title, :string
        field :title_full, :string
        field :created_at, :datetime
        field :pool_id, :id
        field :host_id, :id
    end

    input_object :update_host_params do
        field :description, :string
        field :name, :string
        field :name_full, :string
        field :venue_id, :id
    end

    input_object :update_pool_params do
        field :event_id, :id
        field :seatgeek_id, :id
        field :eventbrite_id, :id
    end

    input_object :update_message_params do
        field :content, :string
        field :read_at, :datetime
        field :from_person, :id
        field :to_person, :id
        field :sent_at, :datetime
    end

    input_object :update_survey_params do
        field :person_id, :id
        field :event_attended, :boolean
        field :met_someone, :boolean
    end

    input_object :update_pals_params do
        field :events_created, :integer
        field :messages_total, :integer
        field :pools_joined, :integer
        field :started_chats, :integer
    end

    input_object :update_pass_params do
        field :events_created, :integer
        field :messages_recieved, :integer
        field :messages_sent, :integer
        field :pools_joined, :integer
        field :started_chats, :integer
        field :age, :integer
        field :person_id, :id
    end

    input_object :update_context_val_params do
        field :education_blurb, :string
        field :occupation_blurb, :string
        field :boat_blurb, :string
        field :eggs_blurb, :string
        field :animal_blurb, :string
        field :worst_pickup_blurb, :string
        field :emoji_blurb, :string
    end

    input_object :update_profile_content_params do
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :emoji_blurb, :string
        field :person_id, :string
    end

    input_object :update_gals_params do
        field :created_events, :integer
        field :event_clicked, :integer
        field :influenced_chats, :integer
        field :pool_clicked, :integer
    end

    input_object :update_version_params do
        field :current_version, :string
        field :target_version, :string
    end

    mutation do

        ##CREATE OBJECT##
        
        field :create_person, type: :person do
            arg :birthday, non_null(:datetime)
            arg :email, non_null(:string)
            arg :gender_id, non_null(:id)
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :target_gender, :string
            arg :target_relationship, :string
            arg :token, :string
            arg :id_token, :string
            arg :auth_token, :string
            arg :email_verified, :boolean
            arg :profile_content_id, :id
            arg :profile_pic, :id
            arg :auth0_me_id, :string
            arg :bio, :string

            resolve &Database.PersonResolver.create/2
        end

        field :create_location, type: :location do
            arg :address, :string
            arg :address_full, :string
            arg :city, :string
            arg :country, :string
            arg :lat, non_null(:float)
            arg :lon, non_null(:float)
            arg :state, :string
            arg :zip, :string

            resolve &Database.LocationResolver.create/2
        end

        field :create_media, type: :media do
            arg :deleted_at, :datetime
            arg :description, :string
            arg :media_type, :string
            arg :url, non_null(:string)
            arg :venue_id, :id 
            arg :event_id, :id

            resolve &Database.MediaResolver.create/2
        end

        field :create_venue, type: :venue do
            arg :category, :string
            arg :description, :string
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :location, :id
            arg :pic, :id

            resolve &Database.VenueResolver.create/2
        end

        field :create_event, type: :event do
            arg :created_by, :id
            arg :location_id, :id
            arg :pic, :id
            arg :category, :string
            arg :description, :string
            arg :end_time, :datetime
            arg :start_time, non_null(:datetime)
            arg :title, non_null(:string)
            arg :title_full, :string
            arg :created_at, :datetime
            arg :pool_id, :id
            arg :host_id, :id

            resolve &Database.EventResolver.create/2
        end

        field :create_host, type: :host do
            arg :description, :string
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :venue_id, :id

            resolve &Database.HostResolver.create/2
        end

        field :create_pool, type: :pool do
            arg :event_id, non_null(:id)
            arg :seatgeek_id, :string
            arg :eventbrite_id, :string

            resolve &Database.PoolResolver.create/2
        end

        field :create_message, type: :message do
            arg :content, non_null(:string)
            arg :read_at, :datetime
            arg :from_person, non_null(:id)
            arg :to_person, non_null(:id)
            arg :sent_at, :datetime

            resolve &Database.MessageResolver.create/2
        end

        field :create_survey, type: :survey do
            arg :person_id, non_null(:id)
            arg :event_attended, :boolean
            arg :met_someone, :boolean

            resolve &Database.SurveyResolver.create/2
        end

        field :create_pals, type: :pals do
            arg :events_created, :integer
            arg :messages_total, :integer
            arg :pools_joined, :integer
            arg :started_chats, :integer
        end

        field :create_pass, type: :pass do
            arg :events_created, :integer
            arg :messages_recieved, :integer
            arg :messages_sent, :integer
            arg :pools_joined, :integer
            arg :started_chats, :integer
            arg :age, :integer
            arg :person_id, non_null(:id)
        end

        field :create_context_val, type: :context_val do
            arg :education_blurb, :string
            arg :occupation_blurb, :string
            arg :boat_blurb, :string
            arg :eggs_blurb, :string
            arg :animal_blurb, :string
            arg :worst_pickup_blurb, :string
            arg :emoji_blurb, :string
        end

        field :create_profile_content, type: :profile_content do
            arg :education_blurb, :string
            arg :occupation_blurb, :string
            arg :boat_blurb, :string
            arg :eggs_blurb, :string
            arg :animal_blurb, :string
            arg :worst_pickup_blurb, :string
            arg :emoji_blurb, :string
            arg :person_id, non_null(:id)
        end

        field :create_gals, type: :gals do
            arg :created_events, :integer
            arg :event_clicked, :integer
            arg :influenced_chats, :integer
            arg :pool_clicked, :integer
        end

        field :create_version, type: :version do
            arg :current_version, non_null(:string)
            arg :target_version, non_null(:string)
        end
        
        ##UPDATE OBJECT##

        field :update_person, type: :person do
            arg :id, non_null(:integer)
            arg :person, :update_person_params

            resolve &Database.PersonResolver.update/2
        end

        field :update_location, type: :location do
            arg :id, non_null(:integer)
            arg :location, :update_location_params

            resolve &Database.LocationResolver.update/2
        end

        field :update_media, type: :media do
            arg :id, non_null(:integer)
            arg :media, :update_media_params

            resolve &Database.MediaResolver.update/2
        end

        field :update_venue, type: :venue do
            arg :id, non_null(:integer)
            arg :venue, :update_venue_params

            resolve &Database.VenueResolver.update/2
        end

        field :update_event, type: :event do
            arg :id, non_null(:integer)
            arg :event, :update_event_params

            resolve &Database.EventResolver.update/2
        end

        field :update_host, type: :host do
            arg :id, non_null(:integer)
            arg :host, :update_host_params

            resolve &Database.HostResolver.update/2
        end

        field :update_pool, type: :pool do
            arg :id, non_null(:integer)
            arg :pool, :update_pool_params

            resolve &Database.PoolResolver.update/2
        end

        field :update_message, type: :message do
            arg :id, non_null(:integer)
            arg :message, :update_message_params

            reslove &Database.MessageResolver.update/2
        end

        field :update_survey, type: :survey do
            arg :id, non_null(:integer)
            arg :survey, :update_survey_params

            resolve &Database.SurveyResolver.update/2
        end

        field :update_pals, type: :pals do
            arg :id, non_null(:integer)
            arg :pals, :update_pals_params

            resolve &Database.PalsResolver.update/2
        end

        field :update_pass, type: :pass do
            arg :id, non_null(:integer)
            arg :pass, :update_pass_params

            resolve &Database.PassResolver.update/2
        end

        field :update_context_val, type: :context_val do
            arg :id, non_null(:integer)
            arg :context_val, :update_context_val_params

            resolve &Database.ContextValResolver.update/2
        end

        field :update_profile_content, type: :profile_content do
            arg :id, non_null(:integer)
            arg :profile_content, :update_profile_content_params

            resolve &Database.ProfileContentResolver.update/2
        end

        field :update_gals, type: :gals do
            arg :id, non_null(:integer)
            arg :gals, :update_gals_params

            resolve &Database.GalsResolver.update/2
        end

        field :update_version, type: :version do
            arg :id, non_null(:integer)
            arg :version, :update_version_params

            resolve &Database.VersionResolver.update/2
        end

        ##DELETE OBJECT##

        field :delete_person, type: :person do
            arg :id, non_null(:integer)
            
            resolve &Database.PersonResolver.delete/2
        end

        field :delete_location, type: :location do
            arg :id, non_null(:integer)

            resolve &Database.LocationResolver.delete/2
        end

        field :delete_media, type: :media do
            arg :id, non_null(:integer)

            resolve &Database.MediaResolver.delete/2
        end

        field :delete_venue, type: :venue do
            arg :id, non_null(:integer)

            resolve &Database.VenueResolver.delete/2
        end

        field :delete_event, type: :event do
            arg :id, non_null(:integer)

            resolve &Database.EventResolver.delete/2
        end

        field :delete_host, type: :host do
            arg :id, non_null(:integer)

            resolve &Database.HostResolver.delete/2
        end

        field :delete_pool, type: :pool do
            arg :id, non_null(:integer)

            resolve &Database.PoolResolver.delete/2
        end

        field :delete_message, type: :message do
            arg :id, non_null(:integer)

            resolve &Database.MessageResolver.delete/2
        end

        field :delete_survey, type: :survey do
            arg :id, non_null(:integer)

            &Database.SurveyResolver.delete/2
        end

        field :delete_pals, type: :pals do
            arg :id, non_null(:integer)
        end

        field :delete_pass, type: :pass do
            arg :id, non_null(:integer)
        end

        field :delete_context_val, type: :context_val do
            arg :id, non_null(:integer)
        end

        field :delete_profile_content, type: :profile_content do
            arg :id, non_null(:integer)
        end

        field :delete_gals, type: :gals do
            arg :id, non_null(:integer)
        end

        field :delete_version, type: :version do
            arg :id, non_null(:integer)
        end

    end

end