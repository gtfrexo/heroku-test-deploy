defmodule DatabaseWeb.ProfileContentControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.ProfileContents
  alias Database.ProfileContents.ProfileContent

  @create_attrs %{animal_blurb: "some animal_blurb", boat_blurb: "some boat_blurb", education_blurb: "some education_blurb", eggs_blurb: "some eggs_blurb", occupation_blurb: "some occupation_blurb", worst_pickup_blurb: "some pickup", emoji_blurb: "some emoji", peson_id: 1}
  @update_attrs %{animal_blurb: "some updated animal_blurb", boat_blurb: "some updated boat_blurb", education_blurb: "some updated education_blurb", eggs_blurb: "some updated eggs_blurb", occupation_blurb: "some updated occupation_blurb", worst_pickup_blurb: "some updated pickup", emoji_blurb: "some updated emoji", person_id: 1}
  @invalid_attrs %{animal_blurb: nil, boat_blurb: nil, education_blurb: nil, eggs_blurb: nil, occupation_blurb: nil, worst_pickup_blurb: nil, emoji_blurb: nil, person_id: nil}

  def fixture(:profile_content) do
    {:ok, profile_content} = ProfileContents.create_profile_content(@create_attrs)
    profile_content
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all profilecontents", %{conn: conn} do
      conn = get conn, profile_content_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create profile_content" do
    test "renders profile_content when data is valid", %{conn: conn} do
      conn = post conn, profile_content_path(conn, :create), profile_content: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, profile_content_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "animal_blurb" => "some animal_blurb",
        "boat_blurb" => "some boat_blurb",
        "education_blurb" => "some education_blurb",
        "eggs_blurb" => "some eggs_blurb",
        "occupation_blurb" => "some occupation_blurb",
        "worst_pickup_blurb" => "some pickup",
        "emoji_blurb" => "some emoji",
        "person_id" => 1
      }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, profile_content_path(conn, :create), profile_content: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update profile_content" do
    setup [:create_profile_content]

    test "renders profile_content when data is valid", %{conn: conn, profile_content: %ProfileContent{id: id} = profile_content} do
      conn = put conn, profile_content_path(conn, :update, profile_content), profile_content: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, profile_content_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "animal_blurb" => "some updated animal_blurb",
        "boat_blurb" => "some updated boat_blurb",
        "education_blurb" => "some updated education_blurb",
        "eggs_blurb" => "some updated eggs_blurb",
        "occupation_blurb" => "some updated occupation_blurb",
        "worst_pickup_blurb" => "some updated pickup",
        "emoji_blurb" => "some updated emoji",
        "person_id" => 1
      }
    end

    test "renders errors when data is invalid", %{conn: conn, profile_content: profile_content} do
      conn = put conn, profile_content_path(conn, :update, profile_content), profile_content: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete profile_content" do
    setup [:create_profile_content]

    test "deletes chosen profile_content", %{conn: conn, profile_content: profile_content} do
      conn = delete conn, profile_content_path(conn, :delete, profile_content)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, profile_content_path(conn, :show, profile_content)
      end
    end
  end

  defp create_profile_content(_) do
    profile_content = fixture(:profile_content)
    {:ok, profile_content: profile_content}
  end
end
