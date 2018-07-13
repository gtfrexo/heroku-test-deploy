defmodule Database.PersonsTest do
  use Database.DataCase

  alias Database.Persons

  describe "persons" do
    alias Database.Persons.Person

    @valid_attrs %{birthday: "2010-04-17 14:00:00.000000Z", email: "some email", gender_id: 1, name: "some name", name_full: "some name_full", target_gender: "some target_gender", target_relationship: "some target_relationship", token: "token", id_token: "id token", auth_token: "auth token", email_verified: false, profile_content_id: 1, profile_pic: 1, auth0_me_id: "auth0", bio: "bio"}
    @update_attrs %{birthday: "2011-05-18 15:01:01.000000Z", email: "some updated email", gender_id: 1, name: "some updated name", name_full: "some updated name_full", target_gender: "some updated target_gender", target_relationship: "some updated target_relationship", token: "updated token", id_token: "updated id token", auth_token: "updated auth token", email_verified: true, profile_content_id: 1, profile_pic: 1, auth0_me_id: "auth0", bio: "bio"}
    @invalid_attrs %{birthday: nil, email: nil, gender_id: nil, name: nil, name_full: nil, target_gender: nil, target_relationship: nil, token: nil, id_token: nil, auth_token: nil, email_verified: nil, profile_content_id: nil, profile_pic: nil, auth0_me_id: nil, bio: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Persons.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Persons.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Persons.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Persons.create_person(@valid_attrs)
      assert person.birthday == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert person.email == "some email"
      assert person.gender_id == 1
      assert person.name == "some name"
      assert person.name_full == "some name_full"
      assert person.target_gender == "some target_gender"
      assert person.target_relationship == "some target_relationship"
      assert person.token == "token"
      assert person.id_token == "id token"
      assert person.auth_token == "auth token"
      assert person.email_verified == false
      assert person.profile_content_id == 1
      assert person.profile_pic == 1
      assert person.auth0_me_id == "auth0"
      assert person.bio == "bio"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, person} = Persons.update_person(person, @update_attrs)
      assert %Person{} = person
      assert person.birthday == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert person.email == "some updated email"
      assert person.gender_id == 1
      assert person.name == "some updated name"
      assert person.name_full == "some updated name_full"
      assert person.target_gender == "some updated target_gender"
      assert person.target_relationship == "some updated target_relationship"
      assert person.token == "updated token"
      assert person.id_token == "updated id token"
      assert person.auth_token == "updated auth token"
      assert person.email_verified == true
      assert person.profile_content_id == 1
      assert person.profile_pic == 1
      assert person.auth0_me_id == "auth0"
      assert person.bio == "bio"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_person(person, @invalid_attrs)
      assert person == Persons.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Persons.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Persons.change_person(person)
    end
  end
end
