defmodule DatabaseWeb.EventControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.Events
  alias Database.Events.Event

  @create_attrs %{category: "some category", description: "some description", end_time: "2010-04-17 14:00:00.000000Z", start_time: "2010-04-17 14:00:00.000000Z", title: "some title", title_full: "some title_full", created_by: 1, location_id: 1, pic: 1, created_at: "2010-04-17 14:00:00.000000Z", pool_id: 1, host_id: 1}
  @update_attrs %{category: "some updated category", description: "some updated description", end_time: "2011-05-18 15:01:01.000000Z", start_time: "2011-05-18 15:01:01.000000Z", title: "some updated title", title_full: "some updated title_full", created_by: 1, location_id: 1, pic: 1, created_at: "2010-04-17 14:00:00.000000Z", pool_id: 1, host_id: 1}
  @invalid_attrs %{category: nil, description: nil, end_time: nil, start_time: nil, title: nil, title_full: nil, created_by: nil, location_id: nil, pic: nil, created_at: nil, pool_id: nil, host_id: nil}

  def fixture(:event) do
    {:ok, event} = Events.create_event(@create_attrs)
    event
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get conn, event_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create event" do
    test "renders event when data is valid", %{conn: conn} do
      conn = post conn, event_path(conn, :create), event: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, event_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "category" => "some category",
        "description" => "some description",
        "end_time" => "2010-04-17 14:00:00.000000Z",
        "start_time" => "2010-04-17 14:00:00.000000Z",
        "title" => "some title",
        "title_full" => "some title_full",
        "created_by" => 1,
        "location_id" => 1,
        "pic" => 1,
        "created_at" => "2010-04-17 14:00:00.000000Z",
        "pool_id" => 1,
        "host_id" => 1
      }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, event_path(conn, :create), event: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update event" do
    setup [:create_event]

    test "renders event when data is valid", %{conn: conn, event: %Event{id: id} = event} do
      conn = put conn, event_path(conn, :update, event), event: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, event_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "category" => "some updated category",
        "description" => "some updated description",
        "end_time" => "2011-05-18 15:01:01.000000Z",
        "start_time" => "2011-05-18 15:01:01.000000Z",
        "title" => "some updated title",
        "title_full" => "some updated title_full",
        "created_by" => 1,
        "location_id" => 1,
        "pic" => 1,
        "created_at" => "2010-04-17 14:00:00.000000Z",
        "pool_id" => 1,
        "host_id" => 1
      }
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put conn, event_path(conn, :update, event), event: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete conn, event_path(conn, :delete, event)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, event_path(conn, :show, event)
      end
    end
  end

  defp create_event(_) do
    event = fixture(:event)
    {:ok, event: event}
  end
end
