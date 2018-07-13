defmodule Database.FileResolver do
    
    alias Database.Files

    def all(_args, _info) do
        {:ok, Files.list_files}
    end

    def find(%{id: id}, _info) do
        case Files.get_file!(id) do
            nil -> {:error, "File with id: #{id} not found."}
            file -> {:ok, file}
        end
    end

    def create(args, _info) do
        Files.create_file(args)
    end

    def update(%{id: id, file: file_params}, _info) do
        Files.get_file!(id)
        |> Files.update_file(file_params)
    end

    def delete(%{id: id}, _info) do
        Files.get_file!(id)
        |> Files.delete_file
    end


end