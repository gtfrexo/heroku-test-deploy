defmodule DatabaseWeb.PoolControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.Pools
  alias Database.Pools.Pool

  @create_attrs %{event_id: 1, seatgeek_id: "seatgeek", eventbrite_id: "eventbrite"}
  @update_attrs %{event_id: 1, seatgeek_id: "updated seatgeek", eventbrite_id: "updated eventbrite"}
  @invalid_attrs %{event_id: nil, seatgeek_id: nil, eventbrite_id: nil}

  def fixture(:pool) do
    {:ok, pool} = Pools.create_pool(@create_attrs)
    pool
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pools", %{conn: conn} do
      conn = get conn, pool_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pool" do
    test "renders pool when data is valid", %{conn: conn} do
      conn = post conn, pool_path(conn, :create), pool: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, pool_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "event_id" => 1,
        "seatgeek_id" => "seatgeek",
        "eventbrite_id" => "eventbrite"
      }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, pool_path(conn, :create), pool: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pool" do
    setup [:create_pool]

    test "renders pool when data is valid", %{conn: conn, pool: %Pool{id: id} = pool} do
      conn = put conn, pool_path(conn, :update, pool), pool: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, pool_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "event_id" => 1,
        "seatgeek_id" => "updated seatgeek",
        "eventbrite_id" => "updated eventbrite"
      }
    end

    test "renders errors when data is invalid", %{conn: conn, pool: pool} do
      conn = put conn, pool_path(conn, :update, pool), pool: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pool" do
    setup [:create_pool]

    test "deletes chosen pool", %{conn: conn, pool: pool} do
      conn = delete conn, pool_path(conn, :delete, pool)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, pool_path(conn, :show, pool)
      end
    end
  end

  defp create_pool(_) do
    pool = fixture(:pool)
    {:ok, pool: pool}
  end
end
