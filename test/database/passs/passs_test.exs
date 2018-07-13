defmodule Database.PasssTest do
  use Database.DataCase

  alias Database.Passs

  describe "passs" do
    alias Database.Passs.Pass

    @valid_attrs %{events_created: 42, messages_recieved: 42, messages_sent: 42, pools_joined: 42, started_chats: 42, age: 19, person_id: 1}
    @update_attrs %{events_created: 43, messages_recieved: 43, messages_sent: 43, pools_joined: 43, started_chats: 43, age: 20, person_id: 1}
    @invalid_attrs %{events_created: nil, messages_recieved: nil, messages_sent: nil, pools_joined: nil, started_chats: nil, age: nil, person_id: nil}

    def pass_fixture(attrs \\ %{}) do
      {:ok, pass} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Passs.create_pass()

      pass
    end

    test "list_passs/0 returns all passs" do
      pass = pass_fixture()
      assert Passs.list_passs() == [pass]
    end

    test "get_pass!/1 returns the pass with given id" do
      pass = pass_fixture()
      assert Passs.get_pass!(pass.id) == pass
    end

    test "create_pass/1 with valid data creates a pass" do
      assert {:ok, %Pass{} = pass} = Passs.create_pass(@valid_attrs)
      assert pass.events_created == 42
      assert pass.messages_recieved == 42
      assert pass.messages_sent == 42
      assert pass.pools_joined == 42
      assert pass.started_chats == 42
      assert pass.age == 19
      assert pass.person_id == 1
    end

    test "create_pass/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Passs.create_pass(@invalid_attrs)
    end

    test "update_pass/2 with valid data updates the pass" do
      pass = pass_fixture()
      assert {:ok, pass} = Passs.update_pass(pass, @update_attrs)
      assert %Pass{} = pass
      assert pass.events_created == 43
      assert pass.messages_recieved == 43
      assert pass.messages_sent == 43
      assert pass.pools_joined == 43
      assert pass.started_chats == 43
      assert pass.age == 20
      assert pass.person_id == 1
    end

    test "update_pass/2 with invalid data returns error changeset" do
      pass = pass_fixture()
      assert {:error, %Ecto.Changeset{}} = Passs.update_pass(pass, @invalid_attrs)
      assert pass == Passs.get_pass!(pass.id)
    end

    test "delete_pass/1 deletes the pass" do
      pass = pass_fixture()
      assert {:ok, %Pass{}} = Passs.delete_pass(pass)
      assert_raise Ecto.NoResultsError, fn -> Passs.get_pass!(pass.id) end
    end

    test "change_pass/1 returns a pass changeset" do
      pass = pass_fixture()
      assert %Ecto.Changeset{} = Passs.change_pass(pass)
    end
  end
end
