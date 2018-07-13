defmodule DatabaseWeb.ContextValControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.ContextVals
  alias Database.ContextVals.ContextVal

  @create_attrs %{animal_blurb: "some animal_blurb", boat_blurb: "some boat_blurb", education_blurb: "some education_blurb", eggs_blurb: "some eggs_blurb", occupation_blurb: "some occupation_blurb", worst_pickup_blurb: "some pickup blurb", emoji_blurb: "some emoji blurb"}
  @update_attrs %{animal_blurb: "some updated animal_blurb", boat_blurb: "some updated boat_blurb", education_blurb: "some updated education_blurb", eggs_blurb: "some updated eggs_blurb", occupation_blurb: "some updated occupation_blurb", worst_pickup_blurb: "some updated pickup blurb", emoji_blurb: "some updated emoji blurb"}
  @invalid_attrs %{animal_blurb: nil, boat_blurb: nil, education_blurb: nil, eggs_blurb: nil, occupation_blurb: nil, worst_pickup_blurb: nil, emoji_blurb: nil}

  def fixture(:context_val) do
    {:ok, context_val} = ContextVals.create_context_val(@create_attrs)
    context_val
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all contextvals", %{conn: conn} do
      conn = get conn, context_val_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create context_val" do
    test "renders context_val when data is valid", %{conn: conn} do
      conn = post conn, context_val_path(conn, :create), context_val: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, context_val_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "animal_blurb" => "some animal_blurb",
        "boat_blurb" => "some boat_blurb",
        "education_blurb" => "some education_blurb",
        "eggs_blurb" => "some eggs_blurb",
        "occupation_blurb" => "some occupation_blurb",
        "worst_pickup_blurb" => "some pickup blurb",
        "emoji_blurb" => "some emoji blurb"
      }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, context_val_path(conn, :create), context_val: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update context_val" do
    setup [:create_context_val]

    test "renders context_val when data is valid", %{conn: conn, context_val: %ContextVal{id: id} = context_val} do
      conn = put conn, context_val_path(conn, :update, context_val), context_val: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, context_val_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "animal_blurb" => "some updated animal_blurb",
        "boat_blurb" => "some updated boat_blurb",
        "education_blurb" => "some updated education_blurb",
        "eggs_blurb" => "some updated eggs_blurb",
        "occupation_blurb" => "some updated occupation_blurb",
        "worst_pickup_blurb" => "some updated pickup blurb",
        "emoji_blurb" => "some updated emoji blurb"
      }
    end

    test "renders errors when data is invalid", %{conn: conn, context_val: context_val} do
      conn = put conn, context_val_path(conn, :update, context_val), context_val: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete context_val" do
    setup [:create_context_val]

    test "deletes chosen context_val", %{conn: conn, context_val: context_val} do
      conn = delete conn, context_val_path(conn, :delete, context_val)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, context_val_path(conn, :show, context_val)
      end
    end
  end

  defp create_context_val(_) do
    context_val = fixture(:context_val)
    {:ok, context_val: context_val}
  end
end
