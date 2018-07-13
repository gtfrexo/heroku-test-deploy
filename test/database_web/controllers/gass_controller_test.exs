defmodule DatabaseWeb.GassControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.Gasss
  alias Database.Gasss.Gass

  @create_attrs %{created_events: 42, event_clicked: 42, influenced_chats: 42, pool_clicked: 42}
  @update_attrs %{created_events: 43, event_clicked: 43, influenced_chats: 43, pool_clicked: 43}
  @invalid_attrs %{created_events: nil, event_clicked: nil, influenced_chats: nil, pool_clicked: nil}

  def fixture(:gass) do
    {:ok, gass} = Gasss.create_gass(@create_attrs)
    gass
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all gasss", %{conn: conn} do
      conn = get conn, gass_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gass" do
    test "renders gass when data is valid", %{conn: conn} do
      conn = post conn, gass_path(conn, :create), gass: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, gass_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "created_events" => 42,
        "event_clicked" => 42,
        "influenced_chats" => 42,
        "pool_clicked" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, gass_path(conn, :create), gass: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gass" do
    setup [:create_gass]

    test "renders gass when data is valid", %{conn: conn, gass: %Gass{id: id} = gass} do
      conn = put conn, gass_path(conn, :update, gass), gass: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, gass_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "created_events" => 43,
        "event_clicked" => 43,
        "influenced_chats" => 43,
        "pool_clicked" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, gass: gass} do
      conn = put conn, gass_path(conn, :update, gass), gass: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gass" do
    setup [:create_gass]

    test "deletes chosen gass", %{conn: conn, gass: gass} do
      conn = delete conn, gass_path(conn, :delete, gass)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, gass_path(conn, :show, gass)
      end
    end
  end

  defp create_gass(_) do
    gass = fixture(:gass)
    {:ok, gass: gass}
  end
end
