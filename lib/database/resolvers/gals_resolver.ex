defmodule Database.GalsResolver do
    
    alias Database.Galss

    def all(_args, _info) do
        {:ok, Galss.list_galss}
    end

    def find(%{id: id}, _info) do
        case Galss.get_gals!(id) do
            nil -> {:error, "Gals with id: #{id} not found."}
            gals -> {:ok, gals}
        end
    end

    def create(args, _info) do
        Galss.create_gals(args)
    end

    def update(%{id: id, gals: gals_params}, _info) do
        Galss.get_gals!(id)
        |> Galss.update_gals(gals_params)
    end

    def delete(%{id: id}, _info) do
        Galss.get_gals!(id)
        |> Galss.delete_gals
    end


end