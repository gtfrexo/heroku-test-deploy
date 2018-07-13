defmodule Database.ContextValsTest do
  use Database.DataCase

  alias Database.ContextVals

  describe "contextvals" do
    alias Database.ContextVals.ContextVal

    @valid_attrs %{animal_blurb: "some animal_blurb", boat_blurb: "some boat_blurb", education_blurb: "some education_blurb", eggs_blurb: "some eggs_blurb", occupation_blurb: "some occupation_blurb", worst_pickup_blurb: "some pickup blurb", emoji_blurb: "some emoji blurb"}
    @update_attrs %{animal_blurb: "some updated animal_blurb", boat_blurb: "some updated boat_blurb", education_blurb: "some updated education_blurb", eggs_blurb: "some updated eggs_blurb", occupation_blurb: "some updated occupation_blurb", worst_pickup_blurb: "some updated pickup blurb", emoji_blurb: "some updated emoji blurb"}
    @invalid_attrs %{animal_blurb: nil, boat_blurb: nil, education_blurb: nil, eggs_blurb: nil, occupation_blurb: nil, worst_pickup_blurb: nil, emoji_blurb: nil}

    def context_val_fixture(attrs \\ %{}) do
      {:ok, context_val} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContextVals.create_context_val()

      context_val
    end

    test "list_contextvals/0 returns all contextvals" do
      context_val = context_val_fixture()
      assert ContextVals.list_contextvals() == [context_val]
    end

    test "get_context_val!/1 returns the context_val with given id" do
      context_val = context_val_fixture()
      assert ContextVals.get_context_val!(context_val.id) == context_val
    end

    test "create_context_val/1 with valid data creates a context_val" do
      assert {:ok, %ContextVal{} = context_val} = ContextVals.create_context_val(@valid_attrs)
      assert context_val.animal_blurb == "some animal_blurb"
      assert context_val.boat_blurb == "some boat_blurb"
      assert context_val.education_blurb == "some education_blurb"
      assert context_val.eggs_blurb == "some eggs_blurb"
      assert context_val.occupation_blurb == "some occupation_blurb"
      assert context_val.worst_pickup_blurb == "some pickup blurb"
      assert context_val.emoji_blurb == "some emoji blurb"
    end

    test "create_context_val/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContextVals.create_context_val(@invalid_attrs)
    end

    test "update_context_val/2 with valid data updates the context_val" do
      context_val = context_val_fixture()
      assert {:ok, context_val} = ContextVals.update_context_val(context_val, @update_attrs)
      assert %ContextVal{} = context_val
      assert context_val.animal_blurb == "some updated animal_blurb"
      assert context_val.boat_blurb == "some updated boat_blurb"
      assert context_val.education_blurb == "some updated education_blurb"
      assert context_val.eggs_blurb == "some updated eggs_blurb"
      assert context_val.occupation_blurb == "some updated occupation_blurb"
      assert context_val.worst_pickup_blurb == "some updated pickup blurb"
      assert context_val.emoji_blurb == "some updated emoji blurb"
    end

    test "update_context_val/2 with invalid data returns error changeset" do
      context_val = context_val_fixture()
      assert {:error, %Ecto.Changeset{}} = ContextVals.update_context_val(context_val, @invalid_attrs)
      assert context_val == ContextVals.get_context_val!(context_val.id)
    end

    test "delete_context_val/1 deletes the context_val" do
      context_val = context_val_fixture()
      assert {:ok, %ContextVal{}} = ContextVals.delete_context_val(context_val)
      assert_raise Ecto.NoResultsError, fn -> ContextVals.get_context_val!(context_val.id) end
    end

    test "change_context_val/1 returns a context_val changeset" do
      context_val = context_val_fixture()
      assert %Ecto.Changeset{} = ContextVals.change_context_val(context_val)
    end
  end
end
