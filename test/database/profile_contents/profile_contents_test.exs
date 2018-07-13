defmodule Database.ProfileContentsTest do
  use Database.DataCase

  alias Database.ProfileContents

  describe "profilecontents" do
    alias Database.ProfileContents.ProfileContent

    @valid_attrs %{animal_blurb: "some animal_blurb", boat_blurb: "some boat_blurb", education_blurb: "some education_blurb", eggs_blurb: "some eggs_blurb", occupation_blurb: "some occupation_blurb", worst_pickup_blurb: "some pickup", emoji_blurb: "some emoji", person_id: 1}
    @update_attrs %{animal_blurb: "some updated animal_blurb", boat_blurb: "some updated boat_blurb", education_blurb: "some updated education_blurb", eggs_blurb: "some updated eggs_blurb", occupation_blurb: "some updated occupation_blurb", worst_pickup_blurb: "some updated pickup", emoji_blurb: "some updated emoji", person_id: 1}
    @invalid_attrs %{animal_blurb: nil, boat_blurb: nil, education_blurb: nil, eggs_blurb: nil, occupation_blurb: nil, worst_pickup_blurb: nil, emoji_blurb: nil, peron_id: nil}

    def profile_content_fixture(attrs \\ %{}) do
      {:ok, profile_content} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ProfileContents.create_profile_content()

      profile_content
    end

    test "list_profilecontents/0 returns all profilecontents" do
      profile_content = profile_content_fixture()
      assert ProfileContents.list_profilecontents() == [profile_content]
    end

    test "get_profile_content!/1 returns the profile_content with given id" do
      profile_content = profile_content_fixture()
      assert ProfileContents.get_profile_content!(profile_content.id) == profile_content
    end

    test "create_profile_content/1 with valid data creates a profile_content" do
      assert {:ok, %ProfileContent{} = profile_content} = ProfileContents.create_profile_content(@valid_attrs)
      assert profile_content.animal_blurb == "some animal_blurb"
      assert profile_content.boat_blurb == "some boat_blurb"
      assert profile_content.education_blurb == "some education_blurb"
      assert profile_content.eggs_blurb == "some eggs_blurb"
      assert profile_content.occupation_blurb == "some occupation_blurb"
      assert profile_content.worst_pickup_blurb == "some pickup"
      assert profile_content.emoji_blurb == "some emoji"
      assert profile_content.person_id == 1
    end

    test "create_profile_content/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProfileContents.create_profile_content(@invalid_attrs)
    end

    test "update_profile_content/2 with valid data updates the profile_content" do
      profile_content = profile_content_fixture()
      assert {:ok, profile_content} = ProfileContents.update_profile_content(profile_content, @update_attrs)
      assert %ProfileContent{} = profile_content
      assert profile_content.animal_blurb == "some updated animal_blurb"
      assert profile_content.boat_blurb == "some updated boat_blurb"
      assert profile_content.education_blurb == "some updated education_blurb"
      assert profile_content.eggs_blurb == "some updated eggs_blurb"
      assert profile_content.occupation_blurb == "some updated occupation_blurb"
      assert profile_content.worst_pickup_blurb == "some updated pickup"
      assert profile_content.emoji_blurb == "some updated emoji"
      assert profile_content.person_id == 1
    end

    test "update_profile_content/2 with invalid data returns error changeset" do
      profile_content = profile_content_fixture()
      assert {:error, %Ecto.Changeset{}} = ProfileContents.update_profile_content(profile_content, @invalid_attrs)
      assert profile_content == ProfileContents.get_profile_content!(profile_content.id)
    end

    test "delete_profile_content/1 deletes the profile_content" do
      profile_content = profile_content_fixture()
      assert {:ok, %ProfileContent{}} = ProfileContents.delete_profile_content(profile_content)
      assert_raise Ecto.NoResultsError, fn -> ProfileContents.get_profile_content!(profile_content.id) end
    end

    test "change_profile_content/1 returns a profile_content changeset" do
      profile_content = profile_content_fixture()
      assert %Ecto.Changeset{} = ProfileContents.change_profile_content(profile_content)
    end
  end
end
