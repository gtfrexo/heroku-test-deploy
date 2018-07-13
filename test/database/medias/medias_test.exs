defmodule Database.MediasTest do
  use Database.DataCase

  alias Database.Medias

  describe "medias" do
    alias Database.Medias.Media

    @valid_attrs %{deleted_at: "2010-04-17 14:00:00.000000Z", description: "some description", media_type: "some media_type", url: "some url", venue_id: 1, event_id: 1}
    @update_attrs %{deleted_at: "2011-05-18 15:01:01.000000Z", description: "some updated description", media_type: "some updated media_type", url: "some updated url", venue_id: 1, event_id: 1}
    @invalid_attrs %{deleted_at: nil, description: nil, media_type: nil, url: nil, venue_id: nil, event_id: nil}

    def media_fixture(attrs \\ %{}) do
      {:ok, media} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medias.create_media()

      media
    end

    test "list_medias/0 returns all medias" do
      media = media_fixture()
      assert Medias.list_medias() == [media]
    end

    test "get_media!/1 returns the media with given id" do
      media = media_fixture()
      assert Medias.get_media!(media.id) == media
    end

    test "create_media/1 with valid data creates a media" do
      assert {:ok, %Media{} = media} = Medias.create_media(@valid_attrs)
      assert media.deleted_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert media.description == "some description"
      assert media.media_type == "some media_type"
      assert media.url == "some url"
      assert media.venue_id == 1
      assert media.event_id == 1
    end

    test "create_media/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medias.create_media(@invalid_attrs)
    end

    test "update_media/2 with valid data updates the media" do
      media = media_fixture()
      assert {:ok, media} = Medias.update_media(media, @update_attrs)
      assert %Media{} = media
      assert media.deleted_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert media.description == "some updated description"
      assert media.media_type == "some updated media_type"
      assert media.url == "some updated url"
      assert media.venue_id == 1
      assert media.event_id == 1
    end

    test "update_media/2 with invalid data returns error changeset" do
      media = media_fixture()
      assert {:error, %Ecto.Changeset{}} = Medias.update_media(media, @invalid_attrs)
      assert media == Medias.get_media!(media.id)
    end

    test "delete_media/1 deletes the media" do
      media = media_fixture()
      assert {:ok, %Media{}} = Medias.delete_media(media)
      assert_raise Ecto.NoResultsError, fn -> Medias.get_media!(media.id) end
    end

    test "change_media/1 returns a media changeset" do
      media = media_fixture()
      assert %Ecto.Changeset{} = Medias.change_media(media)
    end
  end
end
