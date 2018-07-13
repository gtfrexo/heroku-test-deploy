defmodule DatabaseWeb.PersonControllerTest do
  use DatabaseWeb.ConnCase

  alias Database.Persons
  alias Database.Persons.Person

  @create_attrs %{birthday: "2010-04-17 14:00:00.000000Z", email: "some email", gender_id: 1, name: "some name", name_full: "some name_full", target_gender: "some target_gender", target_relationship: "some target_relationship", token: "token", id_token: "id token", auth_token: "auth token", email_verified: false, profile_content_id: 1, profile_pic: 1, auth0_me_id: "auth0", bio: "bio"}
  @update_attrs %{birthday: "2011-05-18 15:01:01.000000Z", email: "some updated email", gender_id: 1, name: "some updated name", name_full: "some updated name_full", target_gender: "some updated target_gender", target_relationship: "some updated target_relationship", token: "updated token", id_token: "updated id token", auth_token: "updated auth token", email_verified: true, profile_content_id: 1, profile_pic: 1, auth0_me_id: "auth0", bio: "bio"}
  @invalid_attrs %{birthday: nil, email: nil, gender_id: nil, name: nil, name_full: nil, target_gender: nil, target_relationship: nil, token: nil, id_token: nil, auth_token: nil, email_verified: nil, profile_content_id: nil, profile_pic: nil, auth0_me_id: nil, bio: nil}

  def fixture(:person) do
    {:ok, person} = Persons.create_person(@create_attrs)
    person
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all persons", %{conn: conn} do
      conn = get conn, person_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create person" do
    test "renders person when data is valid", %{conn: conn} do
      conn = post conn, person_path(conn, :create), person: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, person_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "birthday" => "2010-04-17 14:00:00.000000Z",
        "email" => "some email",
        "gender_id" => 1,
        "name" => "some name",
        "name_full" => "some name_full",
        "target_gender" => "some target_gender",
        "target_relationship" => "some target_relationship",
        "token" => "token",
        "id_token" => "id token",
        "auth_token" => "auth token",
        "email_verified" => false,
        "profile_content_id" => 1,
        "profile_pic" => 1,
        "auth0_me_id" => "auth0",
        "bio" => "bios"
        }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, person_path(conn, :create), person: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update person" do
    setup [:create_person]

    test "renders person when data is valid", %{conn: conn, person: %Person{id: id} = person} do
      conn = put conn, person_path(conn, :update, person), person: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, person_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "birthday" => "2011-05-18 15:01:01.000000Z",
        "email" => "some updated email",
        "gender_id" => 1,
        "name" => "some updated name",
        "name_full" => "some updated name_full",
        "target_gender" => "some updated target_gender",
        "target_relationship" => "some updated target_relationship",
        "token" => "updated token",
        "id_token" => "updated id token",
        "auth_token" => "updated auth token",
        "email_verified" => true,
        "profile_content_id" => 1,
        "profile_pic" => 1,
        "auth0_me_id" => "auth0",
        "bio" => "bios"
      }
    end

    test "renders errors when data is invalid", %{conn: conn, person: person} do
      conn = put conn, person_path(conn, :update, person), person: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete person" do
    setup [:create_person]

    test "deletes chosen person", %{conn: conn, person: person} do
      conn = delete conn, person_path(conn, :delete, person)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, person_path(conn, :show, person)
      end
    end
  end

  defp create_person(_) do
    person = fixture(:person)
    {:ok, person: person}
  end
end
