defmodule Database.EventsTest do
  use Database.DataCase

  alias Database.Events

  describe "events" do
    alias Database.Events.Event

    @valid_attrs %{category: "some category", description: "some description", end_time: "2010-04-17 14:00:00.000000Z", start_time: "2010-04-17 14:00:00.000000Z", title: "some title", title_full: "some title_full", created_by: 1, location_id: 1, pic: 1, created_at: "2010-04-17 14:00:00.000000Z", pool_id: 1, host_id: 1}
    @update_attrs %{category: "some updated category", description: "some updated description", end_time: "2011-05-18 15:01:01.000000Z", start_time: "2011-05-18 15:01:01.000000Z", title: "some updated title", title_full: "some updated title_full", created_by: 1, location_id: 1, pic: 1, created_at: "2010-04-17 14:00:00.000000Z", pool_id: 1, host_id: 1}
    @invalid_attrs %{category: nil, description: nil, end_time: nil, start_time: nil, title: nil, title_full: nil, created_by: nil, location_id: nil, pic: nil, created_at: nil, pool_id: nil, host_id: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.category == "some category"
      assert event.description == "some description"
      assert event.end_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert event.start_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert event.title == "some title"
      assert event.title_full == "some title_full"
      assert event.created_by == 1
      assert event.location_id == 1
      assert event.pic == 1
      assert event.created_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert event.pool_id == 1
      assert event.host_id == 1
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, event} = Events.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.category == "some updated category"
      assert event.description == "some updated description"
      assert event.end_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert event.start_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert event.title == "some updated title"
      assert event.title_full == "some updated title_full"
      assert event.created_by == 1
      assert event.location_id == 1
      assert event.pic == 1
      assert event.created_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert event.pool_id == 1
      assert event.host_id == 1
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
