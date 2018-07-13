defmodule Database.GalssTest do
  use Database.DataCase

  alias Database.Galss

  describe "galss" do
    alias Database.Galss.Gals

    @valid_attrs %{created_events: 42, event_clicked: 42, influenced_chats: 42, pool_clicked: 42}
    @update_attrs %{created_events: 43, event_clicked: 43, influenced_chats: 43, pool_clicked: 43}
    @invalid_attrs %{created_events: nil, event_clicked: nil, influenced_chats: nil, pool_clicked: nil}

    def gals_fixture(attrs \\ %{}) do
      {:ok, gals} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Galss.create_gals()

      gals
    end

    test "list_galss/0 returns all galss" do
      gals = gals_fixture()
      assert Galss.list_galss() == [gals]
    end

    test "get_gals!/1 returns the gals with given id" do
      gals = gals_fixture()
      assert Galss.get_gals!(gals.id) == gals
    end

    test "create_gals/1 with valid data creates a gals" do
      assert {:ok, %Gals{} = gals} = Galss.create_gals(@valid_attrs)
      assert gals.created_events == 42
      assert gals.event_clicked == 42
      assert gals.influenced_chats == 42
      assert gals.pool_clicked == 42
    end

    test "create_gals/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Galss.create_gals(@invalid_attrs)
    end

    test "update_gals/2 with valid data updates the gals" do
      gals = gals_fixture()
      assert {:ok, gals} = Galss.update_gals(gals, @update_attrs)
      assert %Gals{} = gals
      assert gals.created_events == 43
      assert gals.event_clicked == 43
      assert gals.influenced_chats == 43
      assert gals.pool_clicked == 43
    end

    test "update_gals/2 with invalid data returns error changeset" do
      gals = gals_fixture()
      assert {:error, %Ecto.Changeset{}} = Galss.update_gals(gals, @invalid_attrs)
      assert gals == Galss.get_gals!(gals.id)
    end

    test "delete_gals/1 deletes the gals" do
      gals = gals_fixture()
      assert {:ok, %Gals{}} = Galss.delete_gals(gals)
      assert_raise Ecto.NoResultsError, fn -> Galss.get_gals!(gals.id) end
    end

    test "change_gals/1 returns a gals changeset" do
      gals = gals_fixture()
      assert %Ecto.Changeset{} = Galss.change_gals(gals)
    end
  end
end
