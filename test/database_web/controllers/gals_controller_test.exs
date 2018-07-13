defmodule DatabaseWeb.GalsControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.Galss
  alias Database.Galss.Gals

  @create_attrs %{created_events: 42, event_clicked: 42, influenced_chats: 42, pool_clicked: 42}
  @update_attrs %{created_events: 43, event_clicked: 43, influenced_chats: 43, pool_clicked: 43}
  @invalid_attrs %{created_events: nil, event_clicked: nil, influenced_chats: nil, pool_clicked: nil}

  def fixture(:gals) do
    {:ok, gals} = Galss.create_gals(@create_attrs)
    gals
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all galss", %{conn: conn} do
      conn = get conn, gals_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gals" do
    test "renders gals when data is valid", %{conn: conn} do
      conn = post conn, gals_path(conn, :create), gals: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, gals_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "created_events" => 42,
        "event_clicked" => 42,
        "influenced_chats" => 42,
        "pool_clicked" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, gals_path(conn, :create), gals: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gals" do
    setup [:create_gals]

    test "renders gals when data is valid", %{conn: conn, gals: %Gals{id: id} = gals} do
      conn = put conn, gals_path(conn, :update, gals), gals: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, gals_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "created_events" => 43,
        "event_clicked" => 43,
        "influenced_chats" => 43,
        "pool_clicked" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, gals: gals} do
      conn = put conn, gals_path(conn, :update, gals), gals: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gals" do
    setup [:create_gals]

    test "deletes chosen gals", %{conn: conn, gals: gals} do
      conn = delete conn, gals_path(conn, :delete, gals)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, gals_path(conn, :show, gals)
      end
    end
  end

  defp create_gals(_) do
    gals = fixture(:gals)
    {:ok, gals: gals}
  end
end
