defmodule Database.PalssTest do
  use Database.DataCase

  alias Database.Palss

  describe "palss" do
    alias Database.Palss.Pals

    @valid_attrs %{events_created: 42, messages_total: 42, pools_joined: 42, started_chats: 42}
    @update_attrs %{events_created: 43, messages_total: 43, pools_joined: 43, started_chats: 43}
    @invalid_attrs %{events_created: nil, messages_total: nil, pools_joined: nil, started_chats: nil}

    def pals_fixture(attrs \\ %{}) do
      {:ok, pals} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Palss.create_pals()

      pals
    end

    test "list_palss/0 returns all palss" do
      pals = pals_fixture()
      assert Palss.list_palss() == [pals]
    end

    test "get_pals!/1 returns the pals with given id" do
      pals = pals_fixture()
      assert Palss.get_pals!(pals.id) == pals
    end

    test "create_pals/1 with valid data creates a pals" do
      assert {:ok, %Pals{} = pals} = Palss.create_pals(@valid_attrs)
      assert pals.events_created == 42
      assert pals.messages_total == 42
      assert pals.pools_joined == 42
      assert pals.started_chats == 42
    end

    test "create_pals/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Palss.create_pals(@invalid_attrs)
    end

    test "update_pals/2 with valid data updates the pals" do
      pals = pals_fixture()
      assert {:ok, pals} = Palss.update_pals(pals, @update_attrs)
      assert %Pals{} = pals
      assert pals.events_created == 43
      assert pals.messages_total == 43
      assert pals.pools_joined == 43
      assert pals.started_chats == 43
    end

    test "update_pals/2 with invalid data returns error changeset" do
      pals = pals_fixture()
      assert {:error, %Ecto.Changeset{}} = Palss.update_pals(pals, @invalid_attrs)
      assert pals == Palss.get_pals!(pals.id)
    end

    test "delete_pals/1 deletes the pals" do
      pals = pals_fixture()
      assert {:ok, %Pals{}} = Palss.delete_pals(pals)
      assert_raise Ecto.NoResultsError, fn -> Palss.get_pals!(pals.id) end
    end

    test "change_pals/1 returns a pals changeset" do
      pals = pals_fixture()
      assert %Ecto.Changeset{} = Palss.change_pals(pals)
    end
  end
end
