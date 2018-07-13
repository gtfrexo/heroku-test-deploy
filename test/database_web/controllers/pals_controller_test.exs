defmodule DatabaseWeb.PalsControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.Palss
  alias Database.Palss.Pals

  @create_attrs %{events_created: 42, messages_total: 42, pools_joined: 42, started_chats: 42}
  @update_attrs %{events_created: 43, messages_total: 43, pools_joined: 43, started_chats: 43}
  @invalid_attrs %{events_created: nil, messages_total: nil, pools_joined: nil, started_chats: nil}

  def fixture(:pals) do
    {:ok, pals} = Palss.create_pals(@create_attrs)
    pals
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all palss", %{conn: conn} do
      conn = get conn, pals_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pals" do
    test "renders pals when data is valid", %{conn: conn} do
      conn = post conn, pals_path(conn, :create), pals: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, pals_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "events_created" => 42,
        "messages_total" => 42,
        "pools_joined" => 42,
        "started_chats" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, pals_path(conn, :create), pals: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pals" do
    setup [:create_pals]

    test "renders pals when data is valid", %{conn: conn, pals: %Pals{id: id} = pals} do
      conn = put conn, pals_path(conn, :update, pals), pals: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, pals_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "events_created" => 43,
        "messages_total" => 43,
        "pools_joined" => 43,
        "started_chats" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, pals: pals} do
      conn = put conn, pals_path(conn, :update, pals), pals: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pals" do
    setup [:create_pals]

    test "deletes chosen pals", %{conn: conn, pals: pals} do
      conn = delete conn, pals_path(conn, :delete, pals)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, pals_path(conn, :show, pals)
      end
    end
  end

  defp create_pals(_) do
    pals = fixture(:pals)
    {:ok, pals: pals}
  end
end
