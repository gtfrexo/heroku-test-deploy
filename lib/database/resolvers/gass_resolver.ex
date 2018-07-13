defmodule Database.GassResolver do
    
    alias Database.Gasss

    def all(_args, _info) do
        {:ok, Gasss.list_gasss}
    end

    def find(%{id: id}, _info) do
        case Gasss.get_gass!(id) do
            nil -> {:error, "Gass with id: #{id} not found."}
            gass -> {:ok, gass}
        end
    end

    def create(args, _info) do
        Gasss.create_gass(args)
    end

    def update(%{id: id, gass: gass_params}, _info) do
        Gasss.get_gass!(id)
        |> Gasss.update_gass(gass_params)
    end

    def delete(%{id: id}, _info) do
        Gasss.get_gass!(id)
        |> Gasss.delete_gass
    end


end