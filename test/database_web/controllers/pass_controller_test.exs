defmodule DatabaseWeb.PassControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.Passs
  alias Database.Passs.Pass

  @create_attrs %{events_created: 42, messages_recieved: 42, messages_sent: 42, pools_joined: 42, started_chats: 42, age: 19, person_id: 1}
  @update_attrs %{events_created: 43, messages_recieved: 43, messages_sent: 43, pools_joined: 43, started_chats: 43, age: 20, person_id: 1}
  @invalid_attrs %{events_created: nil, messages_recieved: nil, messages_sent: nil, pools_joined: nil, started_chats: nil, age: nil, person_id: nil}

  def fixture(:pass) do
    {:ok, pass} = Passs.create_pass(@create_attrs)
    pass
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all passs", %{conn: conn} do
      conn = get conn, pass_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pass" do
    test "renders pass when data is valid", %{conn: conn} do
      conn = post conn, pass_path(conn, :create), pass: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, pass_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "events_created" => 42,
        "messages_recieved" => 42,
        "messages_sent" => 42,
        "pools_joined" => 42,
        "started_chats" => 42,
        "age" => 19,
        "person_id" => 1
      }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, pass_path(conn, :create), pass: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pass" do
    setup [:create_pass]

    test "renders pass when data is valid", %{conn: conn, pass: %Pass{id: id} = pass} do
      conn = put conn, pass_path(conn, :update, pass), pass: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, pass_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "events_created" => 43,
        "messages_recieved" => 43,
        "messages_sent" => 43,
        "pools_joined" => 43,
        "started_chats" => 43,
        "age" => 20,
        "person_id" => 1
      }
    end

    test "renders errors when data is invalid", %{conn: conn, pass: pass} do
      conn = put conn, pass_path(conn, :update, pass), pass: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pass" do
    setup [:create_pass]

    test "deletes chosen pass", %{conn: conn, pass: pass} do
      conn = delete conn, pass_path(conn, :delete, pass)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, pass_path(conn, :show, pass)
      end
    end
  end

  defp create_pass(_) do
    pass = fixture(:pass)
    {:ok, pass: pass}
  end
end
