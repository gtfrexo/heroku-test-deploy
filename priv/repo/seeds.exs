# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Database.Repo.insert!(%Database.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#alias Database.Persons
#alias Database.Locations
#alias Database.Medias
#alias Database.Venues
#alias Database.Events
#alias Database.Hosts
#alias Database.Files
#alias Database.Messages
#alias Database.Pools
#alias Database.Chats

#PERSON API TESTING#
##NEEDS ATTENTION##
#Persons.create_person(%{age: 22, birthday: Faker.DateTime.backward(3), email: "Faker", events_created: 23, gender: "Scary", messages_recieved: 33, messages_sent: 24, name: "Faker", password: "password", pools_joined: 76, started_chats: 33, target_gender: "scared", target_relationship: "nope", worst_pickup: "geeting"})
#Persons.create_person(%{birthday: Faker.DateTime.backward(3), email: Faker.Internet.email, gender_id: 1, name: Faker.Name.name, name_full: Faker.Name.name, password: Faker.Cat.breed, target_gender: Faker.Pizza.meat, target_relationship: Faker.Beer.name, worst_pickup: Faker.Color.fancy_name, education: Faker.Pizza.cheese, occupation: Faker.Cat.breed, boat_blurb: Faker.Color.name, eggs_blurb: Faker.Pizza.meat, animal_blurb: Faker.Beer.alcohol, dare_blurb: Faker.Name.name})
#Persons.create_person(%{birthday: Faker.DateTime.backward(3), email: Faker.Internet.email, gender_id: 1, name: Faker.Name.name, name_full: Faker.Name.name, password: Faker.Cat.breed, target_gender: Faker.Pizza.meat, target_relationship: Faker.Beer.name, worst_pickup: Faker.Color.fancy_name, education: Faker.Pizza.cheese, occupation: Faker.Cat.breed, boat_blurb: Faker.Color.name, eggs_blurb: Faker.Pizza.meat, animal_blurb: Faker.Beer.alcohol, dare_blurb: Faker.Name.name})
#Persons.get_person!(1)
#Persons.list_persons
#Persons.update_person(Persons.get_person!(1), %{age: Faker.random_between(1,100), birthday: Faker.DateTime.backward(3), email: Faker.Internet.email, gender: Faker.Pizza.cheese, name: Faker.Name.name, name_full: Faker.Name.name, password: Faker.Cat.breed, target_gender: Faker.Pizza.meat, target_relationship: Faker.Beer.name, worst_pickup: Faker.Color.fancy_name, education: Faker.Pizza.cheese, occupation: Faker.Cat.breed, boat_blurb: Faker.Color.name, eggs_blurb: Faker.Pizza.meat, animal_blurb: Faker.Beer.alcohol, dare_blurb: Faker.Name.name})
#Persons.delete_person(Persons.get_person!(2))
#Persons.list_persons

#LOCATIONS API TESTING#
##WORKING##
#Locations.create_location(%{city: Faker.Address.city, state: Faker.Address.state, zip: Faker.Address.zip, address: Faker.Address.street_address, address_full: Faker.Address.secondary_address, country: Faker.Address.country, lat: Faker.Address.latitude, lon: Faker.Address.longitude})
#Locations.create_location(%{city: Faker.Address.city, state: Faker.Address.state, zip: Faker.Address.zip, address: Faker.Address.street_address, address_full: Faker.Address.secondary_address, country: Faker.Address.country, lat: Faker.Address.latitude, lon: Faker.Address.longitude})
#Locations.create_location(%{city: Faker.Address.city, state: Faker.Address.state, zip: Faker.Address.zip, address: Faker.Address.street_address, address_full: Faker.Address.secondary_address, country: Faker.Address.country, lat: Faker.Address.latitude, lon: Faker.Address.longitude})
#Locations.get_location!(1)
#Locations.list_locations
#Locations.update_location(Locations.get_location!(1), %{city: Faker.Address.city, state: Faker.Address.state, zip: Faker.Address.zip, address: Faker.Address.street_address, address_full: Faker.Address.secondary_address, country: Faker.Address.country, lat: Faker.Address.latitude, lon: Faker.Address.longitude})
#Locations.delete_location(Locations.get_location!(2))
#Locations.list_locations

#MEDIA API TESTING#
##WORKING##
#Medias.create_media(%{deleted_at: Faker.DateTime.backward(2), description: Faker.Lorem.sentence, media_type: Faker.Superhero.power, url: Faker.Internet.image_url})
#Medias.create_media(%{deleted_at: Faker.DateTime.backward(3), description: Faker.Lorem.sentence, media_type: Faker.Superhero.power, url: Faker.Internet.image_url})
#Medias.get_media!(1)
#Medias.list_medias
#Medias.update_media(Medias.get_media!(1), %{deleted_at: Faker.DateTime.backward(1), description: Faker.Lorem.sentence, media_type: Faker.Superhero.power, url: Faker.Internet.image_url})
#Medias.delete_media(Medias.get_media!(1))
#Medias.list_medias

#VENUE API TESTING#
##NEEDS ATTENTION##
#Venues.create_venue(%{category: "Faker.Company.name", description: "Faker.Company.buzzword", name: "Faker.Company.name", name_full: "Faker.Compay.name", location: Locations.get_location!(1)})
#Venues.create_venue(%{category: Faker.Company.name, description: Faker.Company.buzzword, events_created: Faker.random_between(1,100), name: Faker.Company.name, location: Locations.get_location!(1)})
#Venues.get_venue!(1)
#Venues.list_venues
#Venues.update_venue(Venues.get_venue!(1), %{category: Faker.Company.name, description: Faker.Company.buzzword, events_created: Faker.random_between(1,100), name: Faker.Company.name, location: Locations.get_location!(1)})
#Venues.delete_venue(Venues.get_venue!(1))
#Venues.list_venues

#EVENT API TESTING#
##WORKING##
##ALL DATA IMPORTED##
#Events.create_event(%{person_id: 1, location_id: 1, media_id: 1, category: Faker.Pizza.cheese, description: Faker.Pizza.combo, end_time: Faker.DateTime.backward(3), start_time: Faker.DateTime.backward(4), title: Faker.Beer.name, title_full: Faker.Beer.style})
#Events.create_event(%{person_id: 1, location_id: 1, media_id: 1, category: Faker.Pizza.cheese, description: Faker.Pizza.combo, end_time: Faker.DateTime.backward(3), start_time: Faker.DateTime.backward(4), title: Faker.Beer.name, title_full: Faker.Beer.style})
#Events.get_event!(1)
#Events.list_events
#Events.update_event(Events.get_event!(1), %{person_id: 1, location_id: 1, media_id: 1, category: Faker.Pizza.cheese, description: Faker.Pizza.combo, end_time: Faker.DateTime.backward(3), start_time: Faker.DateTime.backward(4), title: Faker.Beer.name, title_full: Faker.Beer.style})
#Events.delete_event(Events.get_event!(1))
#Events.list_events

#HOST API TESTING#
##PARTIALLY WORKING//FAKER DATA FAILS##
##ALL DATA IMPORTED##
#Hosts.create_host(%{description: "Faker.Lorem.words", name: "Faker.Name.first_name", name_full: "Faker.Name.name"})
#Hosts.create_host(%{created_events: 7, description: "Faker.Lorem.words", name: "Faker.Name.first_name"})
#Hosts.get_host!(1)
#Hosts.list_hosts
#Hosts.update_host(Hosts.get_host!(1), %{created_events: 9, description: "Faker.Lorem.words", name: "Faker.Name.first_name"})
#Hosts.delete_host(Hosts.get_host!(1))
#Hosts.list_hosts

#FILE API TESTING#
##WORKING##
##ALL DATA IMPORTED##
#Files.create_file(%{content_type: Faker.Pizza.cheese, name: Faker.Name.first_name, name_full: Faker.Name.name, secret: Faker.Cat.name, size: Faker.random_between(1,100), url: Faker.Internet.image_url})
#Files.create_file(%{content_type: Faker.Pizza.cheese, name: Faker.Name.first_name, name_full: Faker.Name.name, secret: Faker.Cat.name, size: Faker.random_between(1,100), url: Faker.Internet.image_url})
#Files.get_file!(1)
#Files.list_files
#Files.update_file(Files.get_file!(1), %{content_type: Faker.Pizza.cheese, name: Faker.Name.first_name, name_full: Faker.Name.name, secret: Faker.Cat.name, size: Faker.random_between(1,100), url: Faker.Internet.image_url})
#Files.delete_file(Files.get_file!(1))
#Files.list_files

#MESSAGE API TESTING#
##WORKING##
##ALL DATA IMPORTED##
#Messages.create_message(%{content: "Faker.Pizza.company", read_at: Faker.DateTime.backward(3), was_read: false, person_id: 1, sent_to_id: 1})
#Messages.create_message(%{content: Faker.Pizza.company, read_at: Faker.DateTime.backward(3), was_read: false, person_id: 1, sent_to_id: 1})
#Messages.get_message!(1)
#Messages.list_messages
#Messages.update_message(Messages.get_message!(1), %{content: Faker.Pizza.company, read_at: Faker.DateTime.backward(3), was_read: false, person_id: 1, sent_to_id: 1})
#Messages.delete_message(Messages.get_message!(1))
#Messages.list_messages

#POOL API TESTING#
##WORKING##
##ALL DATA IMPORTED##
#Pools.create_pool(%{person_id: 1, event_id: 1})
#Pools.create_pool(%{person_id: 1, event_id: 1})
#Pools.get_pool!(1)
#Pools.list_pools
#Pools.update_pool(Pools.get_pool!(1), %{person_id: 1, event_id: 1})
#Pools.delete_pool(Pools.get_pool!(1))
#Pools.list_pools

#CHAT API TESTING#
##WORKING##
##ALL DATA IMPORTED##
#Chats.create_chat(%{pool_id: 1, is_blocked: false})
#Chats.create_chat(%{pool_id: 1, is_blocked: false})
#Chats.get_chat!(1)
#Chats.list_chats
#Chats.update_chat(Chats.get_chat!(1), %{pool_id: 1, is_blocked: false})
#Chats.delete_chat(Chats.get_chat!(1))
#Chats.list_chats