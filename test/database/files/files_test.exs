defmodule Database.FilesTest do
  use Database.DataCase

  alias Database.Files

  describe "files" do
    alias Database.Files.File

    @valid_attrs %{content_type: "some content_type", name: "some name", name_full: "some name_full", secret: "some secret", size: 42, url: "some url"}
    @update_attrs %{content_type: "some updated content_type", name: "some updated name", name_full: "some updated name_full", secret: "some updated secret", size: 43, url: "some updated url"}
    @invalid_attrs %{content_type: nil, name: nil, name_full: nil, secret: nil, size: nil, url: nil}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Files.create_file()

      file
    end

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert Files.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Files.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = Files.create_file(@valid_attrs)
      assert file.content_type == "some content_type"
      assert file.name == "some name"
      assert file.name_full == "some name_full"
      assert file.secret == "some secret"
      assert file.size == 42
      assert file.url == "some url"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, file} = Files.update_file(file, @update_attrs)
      assert %File{} = file
      assert file.content_type == "some updated content_type"
      assert file.name == "some updated name"
      assert file.name_full == "some updated name_full"
      assert file.secret == "some updated secret"
      assert file.size == 43
      assert file.url == "some updated url"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_file(file, @invalid_attrs)
      assert file == Files.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Files.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Files.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Files.change_file(file)
    end
  end
end
