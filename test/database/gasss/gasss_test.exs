defmodule Database.GasssTest do
  use Database.DataCase

  alias Database.Gasss

  describe "gasss" do
    alias Database.Gasss.Gass

    @valid_attrs %{created_events: 42, event_clicked: 42, influenced_chats: 42, pool_clicked: 42}
    @update_attrs %{created_events: 43, event_clicked: 43, influenced_chats: 43, pool_clicked: 43}
    @invalid_attrs %{created_events: nil, event_clicked: nil, influenced_chats: nil, pool_clicked: nil}

    def gass_fixture(attrs \\ %{}) do
      {:ok, gass} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gasss.create_gass()

      gass
    end

    test "list_gasss/0 returns all gasss" do
      gass = gass_fixture()
      assert Gasss.list_gasss() == [gass]
    end

    test "get_gass!/1 returns the gass with given id" do
      gass = gass_fixture()
      assert Gasss.get_gass!(gass.id) == gass
    end

    test "create_gass/1 with valid data creates a gass" do
      assert {:ok, %Gass{} = gass} = Gasss.create_gass(@valid_attrs)
      assert gass.created_events == 42
      assert gass.event_clicked == 42
      assert gass.influenced_chats == 42
      assert gass.pool_clicked == 42
    end

    test "create_gass/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gasss.create_gass(@invalid_attrs)
    end

    test "update_gass/2 with valid data updates the gass" do
      gass = gass_fixture()
      assert {:ok, gass} = Gasss.update_gass(gass, @update_attrs)
      assert %Gass{} = gass
      assert gass.created_events == 43
      assert gass.event_clicked == 43
      assert gass.influenced_chats == 43
      assert gass.pool_clicked == 43
    end

    test "update_gass/2 with invalid data returns error changeset" do
      gass = gass_fixture()
      assert {:error, %Ecto.Changeset{}} = Gasss.update_gass(gass, @invalid_attrs)
      assert gass == Gasss.get_gass!(gass.id)
    end

    test "delete_gass/1 deletes the gass" do
      gass = gass_fixture()
      assert {:ok, %Gass{}} = Gasss.delete_gass(gass)
      assert_raise Ecto.NoResultsError, fn -> Gasss.get_gass!(gass.id) end
    end

    test "change_gass/1 returns a gass changeset" do
      gass = gass_fixture()
      assert %Ecto.Changeset{} = Gasss.change_gass(gass)
    end
  end
end
